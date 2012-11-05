class DesignsController < ApplicationController

  before_filter :get_design, :only => [:edit,:show, :update ]


  def get_design
    @design = Design.find(params[:id])
  end

  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @designs = @user.designs
    else

      @categorys = Category.all
      @designs = Design.all
      @tags = Tag.all
    end
  end

  def create
    @design = Design.new
    @design.image = params[:design][:path].shift
    if @design.save
      #redirect_to edit_design_path(@design)
      respond_to do |format|
        format.html {                                         #(html response is for browsers using iframe sollution)
          render :json => [@design.to_jq_upload].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json {
          render :json => [@design.to_jq_upload].to_json
        }
      end

    else
      render :json => [{:error => "custom_failure"}], :status => 304
      #redirect_to :back
    end
  end

  def show
    @collection = Collection.try(:find,@design.collection_id)
    @user = User.find(@collection.user_id)
    @category = Category.find(@design.category_id) if @design.category_id
  end

  def edit
    @user = current_user
  end

  def update
    params[:design][:tag_ids] ||= []
    @user = current_user
    if @design.update_attributes(params[:design])
      redirect_to @design
    else
      render :edit
    end
  end

  def destroy
    @design = Design.find(params[:id])
    @design.remove_image!
    @design.destroy

    redirect_to user_designs_path(current_user)

  end

end
