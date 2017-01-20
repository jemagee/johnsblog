require 'rails_helper'

RSpec.feature "Viewing Published articles, by specific tag" do

	let!(:sample) {FactoryGirl.create(:article, :published, tag_names: "test1")}
	let!(:sample2) {FactoryGirl.create(:article, :published, tag_names: "test1, test2")}
	let!(:sample3) {FactoryGirl.create(:article, :published, tag_names: "test2, test3")}
	let!(:sample4) {FactoryGirl.create(:article, tag_names: "test2")}

	before {visit root_path}

	scenario "Clicking on tag should load all articles on main page with the same tag" do

		click_link sample2.title

		within("div#tags") do
			click_link "test2"
		end

		expect(page).to have_content(sample2.title)
		expect(page).to have_content(sample3.title)
		expect(page).to_not have_content(sample.title)
		expect(page).to_not have_content(sample4.title)
		expect(page).to have_content("Viewing all articles tagged test2")

		expect(current_url).to eq articles_url(tag_search: "test2")
	end
	
end
