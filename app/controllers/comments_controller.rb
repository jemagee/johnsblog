class CommentsController < ApplicationController

  before_action :get_article
  before_action :get_comment, only: [:edit, :update, :destroy]

  def new
    @comment = @article.comments.build
  end

  def create
    @comment = @article.comments.build(comment_params)
    if @comment.save
      flash[:success] = "Your comment has been created"
      redirect_to @article
    else
      flash.now[:danger] = "Your comment has not been created"
      render 'new'
    end
  end

  def edit
  end

  def update
    @comment.update_attributes(comment_params)
    flash[:success] = "Your comment has been updated"
    redirect_to @article
  end

  def destroy 
    @comment.destroy
    flash[:success] = "Comment has been deleted"
    redirect_to @article
  end

  private

    def comment_params
      params.require(:comment).permit(:title, :body)
    end

    def get_article
      @article = Article.find(params[:article_id])
    end

    def get_comment
      @comment = @article.comments.find(params[:id])
    end
end
