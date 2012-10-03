class DesignsController < ApplicationController

  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @designs = @user.designs
    else

      @designs = Design.all
    end
  end

  def create
    @current_user = User.find(session[:user_id])
    @design = @current_user.designs.build(params[:design])
    if @design.save
      redirect_to @design
    else
      redirect_to :back
    end
  end

  def show
    @design = Design.find(params[:id])
    @user = User.find(@design.user_id)
    @collection = Collection.find(@design.collection_id)
  end

  def edit
    @design = Design.find(params[:id])
    @user = User.find(@design.user_id)
  end

  def update
    @design = Design.find(params[:id])
    @user = User.find(@design.user_id)
    if @design.update_attributes(params[:design])
      redirect_to @design
    else
      redirect_to :back
    end
  end

end
