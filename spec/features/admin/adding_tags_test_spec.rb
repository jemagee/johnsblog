require 'rails_helper'

RSpec.feature "Testing adding tags to an article" do

	let!(:admin) {FactoryGirl.create(:user, :admin)}
	let(:article) {FactoryGirl.create(:article)}

	before do
		login_as(admin)
		visit edit_admin_article_path(article)
	end

	scenario "With one tag" do

		fill_in "Tags", with: "RSpec"

		click_button "Update Article"

		expect(page).to have_content("successfully updated")

		within("div#tags") do
			expect(page).to have_content "RSpec"
		end
	end

	scenario "Adding multiple tags, speraated by comma" do

		fill_in "Tags", with: "RSpec, Ruby Gems, NFL Project"
		click_button "Update Article"

		within("div#tags") do
			expect(page).to have_content("RSpec")
			expect(page).to have_content("Ruby Gems")
			expect(page).to have_content("NFL Project")
		end
	end
end