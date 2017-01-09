require 'rails_helper'

RSpec.feature "The Admin Homepage" do

	let!(:admin) {FactoryGirl.create(:user, :admin)}
	let!(:draft2) {FactoryGirl.create(:article)}
	let!(:draft) {FactoryGirl.create(:article, updated_at: 3.days.ago)}
	let!(:published) {FactoryGirl.create(:article, :published)}
	25.times do |n|
		let!("comment#{n}") {FactoryGirl.create(:comment, body: "This is comment number #{n}", article: published, created_at: (25-n).days.ago)}
	end

	before  do 
		login_as(admin)
		visit admin_root_path
	end

	scenario "The Draft articles should be in the draft section" do

		within("div#drafts div:nth-of-type(1)") do
			expect(page).to have_content(draft2.title)
		end
		within("div#drafts div:nth-of-type(2)") do
			expect(page).to have_content(draft.title)
		end
		
		within("div#drafts") do
			expect(page).to_not have_content(published.title)
		end

		within("div#drafts h3") do
			expect(page).to have_content("Unpublished Drafts - 2")
		end
	end

	scenario "The comment section should only have the 10 most recently comments" do

		within ("div#comments div:nth-of-type(3)") do
			expect(page).to have_content(comment22.body)
			expect(page).to have_link "Delete Comment"
		end
		within ("div#comments") do
			expect(page).to_not have_content(comment0.body)
		end

		within ("div#comments h3") do
			expect(page).to have_content("10 Most Recent Comments")
		end
	end

	scenario "Deleting the 5th child comment (n=20) removes the comment and returns to the admin home page" do

		within ("div#comments div:nth-of-type(5)") do
			click_link "Delete Comment"
		end

		expect(current_path).to eq(admin_root_path)

		within ("div#comments div:nth-of-type(5)") do
			expect(page).to have_content(comment19.body)
			expect(page).to_not have_content(comment20.body)
		end
	end
end