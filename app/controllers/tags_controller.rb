class TagsController < ApplicationController
  def show
    @categorys = Category.all
    @tags = Tag.all
    if params[:id] != 'others'
    @current_tag = Tag.find(params[:id])
    @designs = @current_tag.designs
    else
      @current_tag = nil
      @designs = Design.where(:category_id => nil)
    end
  end
end
