class Admin::TagsController < Admin::BaseController

	def remove
		@article = Article.find(params[:article_id])
		@tag = Tag.find(params[:id])
		@article.tags.destroy(@tag)
		head :ok
	end
end
