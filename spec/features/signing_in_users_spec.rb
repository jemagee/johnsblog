require 'rails_helper'

RSpec.feature "Users can sign in" do
  let!(:user) {FactoryGirl.create(:user, :admin)}

  scenario "With Valid Credentials" do
    visit "/"
    click_link "Sign In"

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Log in"

    expect(page).to have_content("Signed in successfully")
    expect(page).to have_content(user.email)
    expect(page).to have_link("Sign Out")
  end
end