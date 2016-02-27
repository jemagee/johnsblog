require 'rails_helper'

RSpec.feature "Users can sign up" do

  scenario "When providing proper valid details" do

    visit "/"
    click_link "Sign Up"

    fill_in "Email", with: "test@example.com"
    fill_in "user_password", with: "Password"
    fill_in "Password confirmation", with: "Password"

    click_button "Sign up"

    expect(page).to have_content("You have signed up successfully")
  end
end