require 'rails_helper'

RSpec.feature "Viewing an article" do

	let!(:article) { FactoryGirl.create(:article, :published) }
	let!(:admin) {FactoryGirl.create(:user, :admin)}
	let!(:draft) {FactoryGirl.create(:article)}

	scenario "You should be able to view the article from the index page" do

		visit root_path
		click_link article.title

		expect(page).to have_content(article.title)
		expect(page).to have_content(article.body)
	end

	scenario "Clicking the link of a published article should increment the reads count by one" do

		count = article.reads
		visit root_path
		click_link article.title
		within("div#views") do
			expect(page).to have_content("Views: #{count+1}")
		end
	end

	context "Logged in as admin" do

		before {login_as(admin)}

		scenario "The admin should not increpment the view count" do

			visit root_path
			counter = article.reads
			click_link article.title
			within("div#views") do
				expect(page).to have_content("Views: #{counter}")
			end
		end

		scenario "Clicking on a draft should not increment the counter" do
			visit root_path
			counter = draft.reads
			click_link draft.title
			within("div#views") do
				expect(page).to have_content("Views: 0")
			end
		end
	end

end
