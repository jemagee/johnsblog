require 'rails_helper'

RSpec.feature "Users can sign in" do
  let!(:user) {FactoryGirl.create(:user, :admin)}

  scenario "With Valid Credentials" do
    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Log in"

    expect(page).to have_content("Signed in successfully")
    expect(page).to have_link("Sign Out")
    expect(current_path).to eq admin_root_path
  end
end