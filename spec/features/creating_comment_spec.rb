require 'rails_helper'

RSpec.feature "Creating a comment associated with a blog" do

  let!(:article) { FactoryGirl.create(:article, status: "published") }

  before do 
    visit article_path(article)
    click_link "Add Comment"
  end

  scenario "Basic Comment Entering" do

    fill_in "Title", with: "Silly Comment"
    fill_in "Comment", with: "This is silly comment content for testing purposes"

    click_button "Create Comment"

    expect(page).to have_content("Your comment has been created")
    expect(page).to have_content("Silly Comment")
    expect(page).to have_content(article.title)
  end
end