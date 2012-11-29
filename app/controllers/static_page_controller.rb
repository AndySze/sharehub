# encoding: UTF-8
class StaticPageController < ApplicationController

  def about
    #SEO variables
    @page_title = " | 关于"
    @description = "淘灵感www.TaoLingGan.com:寻找灵感，产生创意，创建家居灵感集.致力于为您打造“温馨、美丽之家”， 在这里您可以发现无数充满创意、激发灵感的精美设计； 收集自己喜欢的设计加入自己的灵感收集箱， 并用于自己的家装设计中；轻松的在这里找到专业的、靠谱的设计师； 分享自己的设计风格，让自己成为风向标……"
    @keywords = "淘灵感,家居设计,图片,室内设计,灵感,创意,室内装修,寻找灵感,产生创意,创建家居灵感集,客厅,卧室,厨房,卫生间,餐厅,书房"
  end

  def help
    #SEO variables
    @page_title = " | 帮助信息"
    @description = "淘灵感www.TaoLingGan.com:寻找灵感，产生创意，创建家居灵感集.致力于为您打造“温馨、美丽之家”， 在这里您可以发现无数充满创意、激发灵感的精美设计； 收集自己喜欢的设计加入自己的灵感收集箱， 并用于自己的家装设计中；轻松的在这里找到专业的、靠谱的设计师； 分享自己的设计风格，让自己成为风向标……"
    @keywords = "淘灵感,家居设计,图片,室内设计,灵感,创意,室内装修,寻找灵感,产生创意,创建家居灵感集,客厅,卧室,厨房,卫生间,餐厅,书房"
  end

  def contact
    #SEO variables
    @page_title = " | 联系我们"
    @description = "淘灵感www.TaoLingGan.com:寻找灵感，产生创意，创建家居灵感集.致力于为您打造“温馨、美丽之家”， 在这里您可以发现无数充满创意、激发灵感的精美设计； 收集自己喜欢的设计加入自己的灵感收集箱， 并用于自己的家装设计中；轻松的在这里找到专业的、靠谱的设计师； 分享自己的设计风格，让自己成为风向标……"
    @keywords = "淘灵感,家居设计,图片,室内设计,灵感,创意,室内装修,寻找灵感,产生创意,创建家居灵感集,客厅,卧室,厨房,卫生间,餐厅,书房"
  end

  def index
    #SEO variables
    @page_title = " | 寻找灵感，产生创意，创建家居灵感集"
    @description = "淘灵感www.TaoLingGan.com:寻找灵感，产生创意，创建家居灵感集.致力于为您打造“温馨、美丽之家”， 在这里您可以发现无数充满创意、激发灵感的精美设计； 收集自己喜欢的设计加入自己的灵感收集箱， 并用于自己的家装设计中；轻松的在这里找到专业的、靠谱的设计师； 分享自己的设计风格，让自己成为风向标……"
    @keywords = "淘灵感,家居设计,图片,室内设计,灵感,创意,室内装修,寻找灵感,产生创意,创建家居灵感集,客厅,卧室,厨房,卫生间,餐厅,书房"

    @categorys = Category.all
    @tags = Tag.all
    @designs = Design.order("created_at DESC").page params[:page]
  end

end
