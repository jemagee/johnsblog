class Admin::CommentsController < Admin::BaseController

  before_action :get_comment


  def show
  end

  def edit
  end

  def update
    @comment.update_attributes(comment_params)
    flash[:success] = "Comment has been updated"
    redirect_to [:admin, @comment]
  end

  def destroy
    @comment.destroy
    flash[:success] = "Comment has been deleted"
    redirect_to admin_root_path
  end

  private

    def comment_params
      params.require(:comment).permit(:body, :title)
    end

    def get_comment
      @comment = Comment.find(params[:id])
    end
end
