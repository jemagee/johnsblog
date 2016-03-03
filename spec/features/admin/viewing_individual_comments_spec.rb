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
    before { login_as(admin)}

    scenario "Admind Users can view individual comments" do

      visit admin_comment_path(comment)

      expect(page).to have_content(comment.title)
      expect(page).to have_content(comment.body)
    end
  end
end