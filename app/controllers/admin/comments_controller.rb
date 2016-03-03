class Admin::CommentsController < Admin::BaseController

  def show
    @comment = Comment.find(params[:id])
  end
end
