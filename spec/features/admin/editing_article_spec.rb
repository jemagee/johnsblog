require 'rails_helper'

RSpec.feature "Editing an article" do

	let(:article) { FactoryGirl.create(:article, tag_names: "RSpec, Gems, Delete this tag") }

	before do 
    login_as(FactoryGirl.create(:user, :admin))
		visit edit_admin_article_path(article)
	end

	scenario "Editing an Article" do

		fill_in "Title", with: "New Title"
		fill_in "Body", with: "New Body"
		click_button "Update Article"

		expect(page).to have_content("Your article was successfully updated")
		expect(page).to have_content("New Title")
		expect(page).to have_content("New Body")
		expect(page).to have_content(article.status.upcase)
		expect(page).to_not have_content(article.title)
		expect(page).to_not have_content(article.body)
	end

	scenario "Title can not be blank upon edit" do
		fill_in "Title", with: ""
		click_button "Update Article"

		expect(page).to have_content("Your article has not been altered")
		expect(page).to have_content("Title can't be blank")
		expect(page).to have_content(article.body)
	end

	scenario "Deleting a tag works via AJAX", js: true do

		within tag("Delete this tag") do
			click_link "delete"
		end
		expect(page).to have_content("RSpec")
		expect(page).to have_content("Gems")
		expect(page).to_not have_content("Delete this tag")
	end

end