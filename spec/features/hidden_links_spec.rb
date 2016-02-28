require 'rails_helper'

RSpec.feature "Users and Adminds see the proper links" do

  let(:admin) {FactoryGirl.create(:user, :admin)}
  let!(:article) {FactoryGirl.create(:article)}
  let(:user) {FactoryGirl.create(:user)}

  context "Non admin users can not see admin links" do

    scenario "Can't see hidden links" do

      visit article_path(article)

      expect(page).to_not have_link("Edit Article")
      expect(page).to_not have_link("Delete Article")
      expect(page).to_not have_link("Publish Article")
      expect(page).to_not have_content("STATUS")
    end
  end

  context "Regular Users can not see admin links" do

    before do
      login_as(user)
    end

    scenario "Can't see hidden links" do

      visit article_path(article)

      expect(page).to_not have_link("Edit Article")
      expect(page).to_not have_link("Delete Article")
      expect(page).to_not have_link("Publish Article")
      expect(page).to_not have_content("STATUS")
    end
  end

  context "Admin Users Can See Admin Links" do

    before do 
      login_as(admin)
    end

    scenario "Can see all links" do

      visit article_path(article)

      expect(page).to have_link("Edit Article")
      expect(page).to have_link("Delete Article")
      expect(page).to have_link("Publish Article")
      expect(page).to have_content("STATUS")
    end
  end
end