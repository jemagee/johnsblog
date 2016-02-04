class ArticlesController < ApplicationController

  before_action :get_article, only: [:show, :edit, :update]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)
    flash[:succes] = "Your article has been created"
    redirect_to @article
  end

  def show
  end

  def edit
  end

  def update
    @article.update_attributes(article_params)
    redirect_to @article
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end

  def get_article
   @article = Article.find(params[:id])
  end
end
