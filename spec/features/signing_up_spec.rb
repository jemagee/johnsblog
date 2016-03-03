require 'rails_helper'

RSpec.feature "Users can sign up" do

  scenario "When providing proper valid details and no users" do

    visit new_user_registration_path

    fill_in "Email", with: "test@example.com"
    fill_in "user_password", with: "Password"
    fill_in "Password confirmation", with: "Password"

    click_button "Sign up"

    expect(page).to have_content("You have signed up successfully")
  end

  scenario "When one user is already set up" do
  	FactoryGirl.create(:user)

  	visit new_user_registration_path

  	expect(page).to have_content("You can't sign up")
  	expect(page).to have_current_path(root_path)
  end
end