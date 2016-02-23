require 'rails_helper'

RSpec.feature "Deleting a comment" do
  let!(:article) { FactoryGirl.create(:article, :published)}
  let!(:comment) { FactoryGirl.create(:comment, article: article)}

  before do 
    visit "/"
    click_link article.title
  end

  scenario "Comment can be deleted from Article Page" do

    within("#comment-#{comment.id}") do
      click_link "Delete Comment"
    end

    expect(page).to have_content("Comment has been deleted")
    expect(page).to_not have_content(comment.body)
    expect(page).to have_content(article.title)
  end
end