require 'rails_helper'

RSpec.feature "A signed in user can log out" do
  let!(:user) {FactoryGirl.create(:user, :admin)}

  scenario "The Logged in user can log out" do
    login_as user
    visit "/"
    click_link "Sign Out"

    expect(page).to have_content("Signed out successfully")
  end
end