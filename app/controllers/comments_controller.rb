class CommentsController < ApplicationController

  def new
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)
    @comment.save
    flash[:success] = "Your comment has been created"
    redirect_to @article
  end

  def edit
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
  end

  def update
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.update_attributes(comment_params)
    flash[:success] = "Your comment has been updated"
    redirect_to @article
  end

  private

    def comment_params
      params.require(:comment).permit(:title, :body)
    end
end
