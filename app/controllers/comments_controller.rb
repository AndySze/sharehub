class CommentsController < ApplicationController

  def create
    @design = Design.find(params[:design_id])
    @comment = @design.comments.build(params[:comment])
    if @comment.save
      redirect_to design_path(@design)
    else
      redirect_to :back
    end
  end

end
