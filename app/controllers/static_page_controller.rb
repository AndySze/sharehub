class StaticPageController < ApplicationController

  def about
  end

  def help
  end

  def contact
  end

  def index
    @categorys = Category.all
    @tags = Tag.all
    @designs = Design.order("created_at DESC").page params[:page]
  end

end
