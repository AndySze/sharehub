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
    @current_user = User.find(session[:user_id])
    @design = @current_user.designs.build(params[:design])
    if @design.save
      redirect_to edit_design_path(@design)
    else
      redirect_to :back
    end
  end

  def show
    @collection = Collection.find(@design.collection_id)
    @user = User.find(@collection.user_id)
    @current_user = User.find(session[:user_id]) if session[:user_id]
    @category = Category.find(@design.category_id) if @design.category_id
  end

  def edit
    @collection = Collection.find(@design.collection_id)
    @user = User.find(@collection.user_id)
  end

  def update
    params[:design][:tag_ids] ||= []
    @collection = Collection.find(@design.collection_id)
    @user = User.find(@collection.user_id)
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

    @current_user = User.find(session[:user_id])
    redirect_to user_designs_path(@current_user)

  end

end
