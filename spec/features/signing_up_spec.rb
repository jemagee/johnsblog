require 'rails_helper'

RSpec.feature "Users sign up" do

  scenario "When one user is already set up" do
  	FactoryGirl.create(:user)

  	visit new_user_registration_path

  	expect(page).to have_content("You can't sign up")
  	expect(page).to have_current_path(root_path)
  end
end