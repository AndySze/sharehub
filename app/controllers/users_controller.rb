class UsersController < ApplicationController


  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
      @user = User.create(params[:user]) unless params[:password] != params[:confirm_password]
      if @user.save
        session[:user_id] = @user.id
        session[:user_name] = @user.name
        redirect_to @user
      else
        #redirect_to :back
        render :new
      end
  end

  def show
    @user = User.find(params[:id])
    if @user.name == session[:user_name]
      @design = @user.designs.build
      @collection = @user.collections.build
    end

  end

  def update
    @user = User.find(params[:id])
    if params[:password] == params[:confirm_password]
      if @user.update_attributes(params[:user])
        flash[:success] ="Welcome to ShareHub!"
        redirect_to @user
      else
        render :back
      end
    else
      flash[:error] = "password not match!"
      return false
    end
  end

end

