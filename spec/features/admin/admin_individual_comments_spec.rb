require 'rails_helper'

RSpec.feature "Viewing Individual Comments in the Admin Namespace" do

  let(:user) {FactoryGirl.create(:user)}
  let(:admin) {FactoryGirl.create(:user, :admin)}
  let(:article) {FactoryGirl.create(:article)}
  let!(:comment) {FactoryGirl.create(:comment, article: article)}

  context "Anonymous Users" do

    scenario "Anonymous Users can not view individual comments" do

      visit admin_comment_path(comment)

      expect(page).to have_content("You can not access that page")
      expect(page).to have_current_path(root_path)
    end
  end

  context "Users" do
    before { login_as(user) }

    scenario "Registered Users can not view individual comments" do

      visit admin_comment_path(comment)

      expect(page).to have_content("You can not access that page")
      expect(page).to have_current_path(root_path)
    end
  end


  context "Admin Users" do
    before  do 
      login_as(admin)
      visit admin_comment_path(comment)
    end

    scenario "Admin Users can view individual comments" do

      expect(page).to have_content(comment.title)
      expect(page).to have_content(comment.body)
    end

    scenario "Admin can edit individual comments" do

      click_link "Edit Comment"

      fill_in "Body", with: "New Comment Body"
      fill_in "Title", with: "New Comment Title"

      click_button "Update Comment"

      expect(page).to have_content("Comment has been updated")
      expect(page).to have_content("New Comment Body")
      expect(page).to have_content("New Comment Title")
    end

    scenario "Admin can delete individual comments" do

      click_link "Delete Comment"

      expect(page).to have_content("Comment has been deleted")
      expect(page).to have_current_path(admin_root_path)
    end
  end
end