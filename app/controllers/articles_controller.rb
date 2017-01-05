class ArticlesController < ApplicationController

  before_action :get_article, only: [:show]

  def index
    if (user_signed_in? && current_user.admin?)
      @articles = Article.all
    else
      @articles = Article.published
    end
  end

  def show
    @article.increment!(:reads) unless (user_signed_in? && current_user.admin?)
  end

  private

  def get_article
   @article = Article.find(params[:id])
  end
end
