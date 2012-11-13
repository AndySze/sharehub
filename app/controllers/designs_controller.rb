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
    @design = Design.new(params[:design])
    if @design.save
      redirect_to edit_design_path(@design)
    else
      redirect_to :back
    end
  end

  def show
    @collection = @design.collection
    @user = @collection.user
    @category = Category.find(@design.category_id) if @design.category_id
    @comment = @design.comments.build
  end

  def edit
    @user = current_user
    @collection = @user.collections.new
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
