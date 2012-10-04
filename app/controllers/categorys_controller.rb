class CategorysController < ApplicationController
  def show
    @categorys = Category.all
    @tags = Tag.all

    if params[:id] != 'others'
      @category = Category.find(params[:id])
      @designs = Design.where("category_id = ?",@category.id)
    else
      @category = nil
      @designs = Design.where(:category_id => nil)
    end

  end

end
