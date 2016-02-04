require 'rails_helper'

RSpec.feature "Viewing an article" do

	let!(:article) { FactoryGirl.create(:article) }

	scenario "You should be able to view the article from the index page" do

		visit root_path
		click_link article.title

		expect(page).to have_content(article.title)
		expect(page).to have_content(article.body)
	end
end
