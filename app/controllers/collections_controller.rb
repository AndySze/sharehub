# encoding: UTF-8
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

    #SEO variables
    @page_title = " | #{@user.name}的灵感集"
    @description = "淘灵感www.TaoLingGan.com:寻找灵感，产生创意，创建家居灵感集.致力于为您打造“温馨、美丽之家”， 在这里您可以发现无数充满创意、激发灵感的精美设计； 收集自己喜欢的设计加入自己的灵感收集箱， 并用于自己的家装设计中；轻松的在这里找到专业的、靠谱的设计师； 分享自己的设计风格，让自己成为风向标……"
    @keywords = "淘灵感,家居设计,图片,室内设计,灵感,创意,室内装修,寻找灵感,产生创意,创建家居灵感集,客厅,卧室,厨房,卫生间,餐厅,书房"
  end

  def create
    @collection = current_user.collections.build(params[:collection])
    if @collection.save
      flash[:success] = "Collection Saved!"
      redirect_to :back
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
    if current_user
      @design = @user.designs.build
      @newcollection = @user.collections.build
    end

    #SEO variables
    @page_title = " | #{@collection.name}"
    @description = "淘灵感www.TaoLingGan.com:寻找灵感，产生创意，创建家居灵感集.致力于为您打造“温馨、美丽之家”， 在这里您可以发现无数充满创意、激发灵感的精美设计； 收集自己喜欢的设计加入自己的灵感收集箱， 并用于自己的家装设计中；轻松的在这里找到专业的、靠谱的设计师； 分享自己的设计风格，让自己成为风向标……"
    @keywords = "淘灵感,家居设计,图片,室内设计,灵感,创意,室内装修,寻找灵感,产生创意,创建家居灵感集,客厅,卧室,厨房,卫生间,餐厅,书房"

  end

end
