require 'rails_helper'

RSpec.feature "Testing the Public article index" do

	let!(:user) {FactoryGirl.create(:user)}
	let!(:admin) {FactoryGirl.create(:user, :admin)}
	let!(:draft) {FactoryGirl.create(:article)}
	let!(:published) {FactoryGirl.create(:article, published_on: Date.today, status: "published")}
	let!(:oldarticle) {FactoryGirl.create(:article, published_on: Date.today.days_ago(60), status: "published")}
	let!(:newest) {FactoryGirl.create(:article, status: "published", published_on: Date.today.months_since(3))}
	let!(:comment) {FactoryGirl.create(:comment, article: published)}

	context "As an anonymous user" do

		before { visit root_path }

		scenario "should not have draft articles" do
			expect(page).to_not have_content(draft.title)
		end

		scenario "should have published articles" do
			expect(page).to have_content(published.title)
			expect(page).to have_content(oldarticle.title)
			expect(page).to have_content(newest.title)
		end


		scenario "Published articles should be displayed newest to oldest, with comment count" do
			within("#articles") do
				within("div:nth-child(1)") do
					expect(page).to have_content(newest.title)
					expect(page).to have_content("Published #{time_ago_in_words(newest.published_on)}")
					expect(page).to have_content("Comments: 0")
				end
				within("div:nth-child(2)") do
					expect(page).to have_content(published.title)
					expect(page).to have_content("Published #{time_ago_in_words(published.published_on)}")
					expect(page).to have_content("Comments: 1")
				end
				within("div:nth-child(3)") do
					expect(page).to have_content(oldarticle.title)
					expect(page).to have_content("Published #{time_ago_in_words(oldarticle.published_on)}")
				end
			end
		end
	end

	scenario "As an admin user" do
		login_as(admin)
		visit root_path

		expect(page).to have_content(published.title)
		expect(page).to have_content(draft.title)
	end
end

