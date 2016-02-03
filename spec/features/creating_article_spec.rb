require 'rails_helper'

RSpec.feature "Adding a new article" do

  before do
    visit new_article_path
  end

  scenario "Entering the proper information" do
    fill_in "Title", with: "Title of Test Article"
    fill_in "Body", with: "This is the test body of the article"
    click_button "Create Article"

    expect(page).to have_content("Your article has been created")
    expect(page).to have_content("Title of Test Article")
    expect(page).to have_content("This is the test body of the article")
    expect(page).to have_content("Status: DRAFT")
  end
end