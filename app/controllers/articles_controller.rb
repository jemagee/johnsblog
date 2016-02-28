class ArticlesController < ApplicationController

  before_action :get_article, only: [:show]

  def index
    @articles = Article.all
  end

  def show
  end

  private

  def get_article
   @article = Article.find(params[:id])
  end
end
