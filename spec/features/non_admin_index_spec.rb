require 'rails_helper'

RSpec.feature "Testing the Public article index" do

	let!(:user) {FactoryGirl.create(:user)}
	let!(:admin) {FactoryGirl.create(:user, :admin)}
	let!(:draft) {FactoryGirl.create(:article)}
	let!(:published) {FactoryGirl.create(:article, title: "This is the published title", status: 'published')}
	let!(:archived) {FactoryGirl.create(:article, title: "This is the archived title", status: 'archived')}

	scenario "As an anonymous user" do
		visit root_path

		expect(page).to have_content(published.title)
		expect(page).to have_content(archived.title)
		expect(page).to_not have_content(draft.title)
	end

	scenario "As a logged in non-admin user" do
		login_as(user)
		visit root_path

		expect(page).to have_content(published.title)
		expect(page).to have_content(archived.title)
		expect(page).to_not have_content(draft.title)
	end

	scenario "As an admin user" do
		login_as(admin)
		visit root_path

		expect(page).to have_content(published.title)
		expect(page).to have_content(archived.title)
		expect(page).to have_content(draft.title)
	end
end

