require 'rails_helper'

RSpec.feature "Creating a comment associated with a blog" do

  let!(:article) { FactoryGirl.create(:article, status: "published") }

  before do 
    visit article_path(article)
  end

  scenario "Basic Comment Entering" do
    within("#new_comment_form") do
      fill_in "Title", with: "Silly Comment"
      fill_in "Comment", with: "This is silly comment content for testing purposes"
    end

    click_button "Create Comment"

    expect(page).to have_content("Your comment has been created")
    expect(page).to have_content("Silly Comment")
    expect(page).to have_content(article.title)
  end

  scenario "Comment requires a title" do
    within("#new_comment_form") do
      fill_in "Comment", with: "This is a silly comment without a title"
    end

    click_button "Create Comment"
    expect(page).to have_content("Your comment has not been created")
    expect(page).to_not have_content("This is a silly comment without a title")
  end
end