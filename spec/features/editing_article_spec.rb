require 'rails_helper'

RSpec.feature "Editing an article" do

	let(:article) { FactoryGirl.create(:article) }

	before do 
		visit article_path(article)
	end

	scenario "Editing an Article" do
		click_link "Edit Article"

		fill_in "Title", with: "New Title"
		fill_in "Body", with: "New Body"
		click_button "Update Article"

		expect(page).to have_content("New Title")
		expect(page).to have_content("New Body")
		expect(page).to have_content(article.status.upcase)
		expect(page).to_not have_content(article.title)
		expect(page).to_not have_content(article.body)
	end
end