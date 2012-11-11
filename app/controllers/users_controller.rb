class UsersController < ApplicationController

  before_filter :get_user, :only => [:edit,:show, :update ]

  def get_user
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def edit
  end

  def create
    @user = User.create(params[:user])
    if @user.save
      redirect_to @user
    else
      #redirect_to :back
      render :new
    end
  end

  def show
    if  current_user
      @design = @user.designs.build
      @collection = @user.collections.build
    end

    @designs = @user.designs

  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] ="Welcome to ShareHub!"
      redirect_to @user
    else
      render :back
    end
  end

end

