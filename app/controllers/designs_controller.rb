class DesignsController < ApplicationController
  def index
    @designs = Design.all
  end

  def create
    @current_user = User.find(session[:user_id])
    @design = @current_user.designs.build(params[:design])
    if @design.save
      redirect_to @design
    end
  end

  def show
    @design = Design.find(params[:id])
    @user = User.find(@design.user_id)
  end

  def edit
    @design = Design.find(params[:id])
  end

  def update
    @design = Design.find(params[:id])
    if @design.update_attributes(params[:design])
      redirect_to @design
    end
  end

end
