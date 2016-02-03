class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(get_article_params)
    flash[:succes] = "Your article has been created"
    redirect_to @article
  end

  def show
    @article = Article.find(params[:id])
  end

  private

  def get_article_params
    params.require(:article).permit(:title, :body)
  end
end
