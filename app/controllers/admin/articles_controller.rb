class Admin::ArticlesController < Admin::BaseController

  before_action :get_article, only: [:edit, :update, :destroy, :publish, :show]

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:succes] = "Your article has been created"
      redirect_to @article
    else
      flash.now[:warning] = "Your article was not created"
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
     if @article.update_attributes(article_params)
      flash[:success] = "Your article was successfully updated"
      redirect_to @article
    else
      flash.now[:warning] = "Your article has not been altered"
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    flash[:success] = "Your article was deleted"
    redirect_to articles_path
  end

  def publish
    if @article.update_attributes(status: "published")
      flash[:success] = "Your article has been published"
      redirect_to @article
    else
      flash[:warning] = "Your article has not been published"
      @article.status = "draft"
      render 'edit'
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :abstract, :category_id, :tag_names)
  end

  def get_article
   @article = Article.find(params[:id])
  end
end
