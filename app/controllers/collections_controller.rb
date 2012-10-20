class CollectionsController < ApplicationController

  before_filter :get_collection, :only => [:show, :update ]

  def get_collection
    @collection = Collection.find(params[:id])
  end

  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @collections = @user.collections
    else
      @collections = Collection.all
    end
  end

  def create
    @current_user = User.find(session[:user_id])
    @collection = @current_user.collections.build(params[:collection])
    if @collection.save
      flash[:success] = "Collection Saved!"
      redirect_to @current_user
    else
      redirect_to :back
    end

  end

  def update
    @current_user = User.find(@collection.user_id)
    if @collection.update_attributes(params[:collection])
      flash[:success] = "Collection Saved!"
      redirect_to @collection
    else
      redirect_to :back
    end
  end

  def show
    @user = User.find(@collection.user_id)
    if @user.name == session[:user_name]
      @design = @user.designs.build
      @newcollection = @user.collections.build
    end

  end

end
