# encoding: UTF-8
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

    #SEO variables
    @page_title = " | #{@user.name}的设计"
    @description = "淘灵感www.TaoLingGan.com:寻找灵感，产生创意，创建家居灵感集.致力于为您打造“温馨、美丽之家”， 在这里您可以发现无数充满创意、激发灵感的精美设计； 收集自己喜欢的设计加入自己的灵感收集箱， 并用于自己的家装设计中；轻松的在这里找到专业的、靠谱的设计师； 分享自己的设计风格，让自己成为风向标……"
    @keywords = "淘灵感,家居设计,图片,室内设计,灵感,创意,室内装修,寻找灵感,产生创意,创建家居灵感集,客厅,卧室,厨房,卫生间,餐厅,书房"
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

    #SEO variables
    @page_title = " | #{@design.title}"
    @description = "淘灵感www.TaoLingGan.com:寻找灵感，产生创意，创建家居灵感集." + @design.title
    @keywords = "淘灵感,家居设计,图片,室内设计,灵感,创意,室内装修,寻找灵感,产生创意,创建家居灵感集,客厅,卧室,厨房,卫生间,餐厅,书房"
  end

  def edit
    @user = current_user
    @collection = @user.collections.new

    #SEO variables
    @page_title = " | 编辑设计信息"
    @description = "淘灵感www.TaoLingGan.com:寻找灵感，产生创意，创建家居灵感集.致力于为您打造“温馨、美丽之家”， 在这里您可以发现无数充满创意、激发灵感的精美设计； 收集自己喜欢的设计加入自己的灵感收集箱， 并用于自己的家装设计中；轻松的在这里找到专业的、靠谱的设计师； 分享自己的设计风格，让自己成为风向标……"
    @keywords = "淘灵感,家居设计,图片,室内设计,灵感,创意,室内装修,寻找灵感,产生创意,创建家居灵感集,客厅,卧室,厨房,卫生间,餐厅,书房"
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
