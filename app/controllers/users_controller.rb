#encoding: UTF-8
class UsersController < ApplicationController

  before_filter :get_user, :only => [:edit,:show, :update ]


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
    @designs = @user.designs

    if  current_user == @user
      @design = @user.designs.build
      @collection = @user.collections.build
      @page_title = " | 上传新设计"
    else
      @page_title = " | #{@user.name}的灵感及设计"
    end

    #@designs = Design.order("created_at DESC")

    #SEO variables
    @description = "淘灵感www.TaoLingGan.com:寻找灵感，产生创意，创建家居灵感集.致力于为您打造“温馨、美丽之家”， 在这里您可以发现无数充满创意、激发灵感的精美设计； 收集自己喜欢的设计加入自己的灵感收集箱， 并用于自己的家装设计中；轻松的在这里找到专业的、靠谱的设计师； 分享自己的设计风格，让自己成为风向标……"
    @keywords = "淘灵感,家居设计,图片,室内设计,灵感,创意,室内装修,寻找灵感,产生创意,创建家居灵感集,客厅,卧室,厨房,卫生间,餐厅,书房"
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] ="Welcome to ShareHub!"
      redirect_to @user
    else
      render :back
    end
  end

  private

  def get_user
    @user = User.find(params[:id])
  end

end

