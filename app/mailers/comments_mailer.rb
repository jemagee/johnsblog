class CommentsMailer < ApplicationMailer

	def new_comment(comment)
		@article = comment.article
		@comment = comment
		mail(
			to: "admin@mageeworld.com",
			subject: "New Comment On Article")
	end
end
