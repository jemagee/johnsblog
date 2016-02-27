require 'rails_helper'

RSpec.feature "A signed in user can log out" do
  let!(:user) {FactoryGirl.create(:user)}

  scenario "The Logged in user can log out" do
    login_as user
    visit "/"
    click_link "Sign Out"

    expect(page).to have_content("Signed out successfully")
    expect(page).to have_link("Sign In")
    expect(page).not_to have_content(user.email)
  end
end