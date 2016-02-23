require 'rails_helper'

RSpec.feature "Editing and existing comment" do

  let!(:article) {FactoryGirl.create(:article, :published)}
  let!(:comment) {FactoryGirl.create(:comment, article: article)}

  before do
    visit "/"
    click_link article.title
    within("#comment-#{comment.id}") do
      click_link "Edit Comment"
    end
  end

  scenario "Editing a comment cleanly" do
    fill_in "Title", with: "New Comment Title"
    fill_in "Comment", with: "NEw Comment body for new comment title"

    click_button "Update Comment"

    expect(page).to have_content("Your comment has been updated")
    within("#comment-#{comment.id}") do
      expect(page).to have_content("New Comment Title")
      expect(page).to_not have_content(comment.body)
    end
    expect(page).to have_content(article.title)
  end
end