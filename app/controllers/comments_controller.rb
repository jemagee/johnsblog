class CommentsController < ApplicationController

  before_action :get_article

  def create
    @comment = @article.comments.build(comment_params)
    if @comment.email.length == 0
      if @comment.save
        flash[:success] = "Your comment has been created"
        redirect_to @article
      else
        flash[:danger] = "Your comment has not been created"
        redirect_to @article
      end
    else
      flash[:success] = "Your comment has been created"
      redirect_to @article
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:title, :body, :email)
    end

    def get_article
      @article = Article.find(params[:article_id])
    end
end
