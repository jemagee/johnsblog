require 'rails_helper'

RSpec.feature "Creating a comment associated with a blog" do

  let!(:article) { FactoryGirl.create(:article, status: "published") }

  before do 
    visit article_path(article)
  end

  scenario "Basic Comment Entering" do
    within("#new_comment_form") do
      fill_in "comment_body", with: "This is silly comment content for testing purposes"
    end

    click_button "Add Comment"

    expect(page).to have_content("Your comment has been created")
    expect(page).to have_content("This is silly comment content for testing purposes")
    expect(page).to have_content(article.title)
  end

  scenario "Comment requires a body" do
    click_button "Add Comment"
    expect(page).to have_content("Your comment has not been created")
    expect(page).to_not have_content("This is a silly comment without a title")
  end

  scenario "A Comment doesn't allow html to be processed" do
    within("#new_comment_form") do
      fill_in "comment_body", with: "This is a silly little <b>bold comment</b>"
    end

    click_button "Add Comment"
    expect(page).to have_content("Your comment has been created")
    expect(page).to_not have_content("<b>bold comment</b>")
    expect(page).to have_content("little bold comment")
  end

  scenario "A comment won't process a link either" do
    within ("#new_comment_form") do
      fill_in "comment_body", with: '<a href="http://espn.go.com">Espn Web Site</a>'
    end

    click_button "Add Comment"
    expect(page).to have_content("Your comment has been created")
    expect(page).to have_content("Espn Web Site")
    expect(page).to_not have_link('espn.go.com')
  end
end