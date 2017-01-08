require 'rails_helper'

RSpec.feature "The Admin Homepage" do

	let!(:admin) {FactoryGirl.create(:user, :admin)}
	let!(:draft) {FactoryGirl.create(:article)}
	let!(:draft2) {FactoryGirl.create(:article, updated_at: 3.days.ago)}
	let!(:published) {FactoryGirl.create(:article, :published)}
	25.times do |n|
		let("comment#{n}".to_s) {FactoryGirl.create(:comment, article: published, created_at: n.days.ago)}
	end

	before  do 
		login_as(admin)
		visit admin_root_path
	end

	scenario "The Draft articles should be in the draft section" do

		within("div#drafts") do
			expect(page).to have_content(draft.title)
			expect(page).to have_content(draft2.title)
			expect(page).to_not have_content(published.title)
		end
	end

	scenario "The comment section should only have the 10 most recently comments" do

		within ("div#comments") do
			expect(page).to have_content(comment1.body)
			expect(page).to have_content(comment10.body)
			expect(page).to_not have_content(comment25.body)
		end
	end
end