require 'rails_helper'

RSpec.feature "Adding a new article" do

  before do
    login_as(FactoryGirl.create(:user, :admin))
    visit new_admin_article_path
  end

  scenario "Entering the proper information" do
    fill_in "Title", with: "Title of Test Article"
    fill_in "Body", with: "This is the test body of the article"
    fill_in "Abstract", with: "This is the test abstract of the article"
    select "Computer", from: "article[category_id]"
    click_button "Create Article"

    expect(page).to have_content("Your article has been created")
    expect(page).to have_content("Title of Test Article")
    expect(page).to have_content("This is the test body of the article")
    expect(page).to have_content("Category: Computer")
    expect(page).to have_content("Status: DRAFT")
  end

  scenario "A new article, even a draft, requires a title" do
    click_button "Create Article"

    expect(page).to have_content("Your article was not created")
    expect(page).to have_content("Title can't be blank")
    expect(page).to_not have_content("Status: DRAFT")
  end
end