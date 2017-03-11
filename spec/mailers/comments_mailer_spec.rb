require "rails_helper"

RSpec.describe CommentsMailer, type: :mailer do
  
  let!(:article) {FactoryGirl.create(:article, :published)}
  let!(:comment) {FactoryGirl.create(:comment, article: article)}

  describe "#new_comment" do
  	subject(:email) {CommentsMailer.new_comment(comment)}

  	it "delivers to admin@mageeworld.com" do
  		expect(email).to deliver_to("admin@mageeworld.com")
  	end

  	it "has the proper subject" do
  		expect(email).to have_subject("New Comment On Article")
  	end

  	it "has the article name in the body" do
  		expect(email).to have_body_text(article.title)
  	end

  	it "has a link to the article" do
  		expect(email).to have_body_text(article_url(article))
  	end

  	it "has the comment text" do
  		expect(email).to have_body_text(comment.body)
  	end
  end
end
