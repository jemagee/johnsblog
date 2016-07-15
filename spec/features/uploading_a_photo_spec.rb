require 'rails_helper'

RSpec.feature "Uploading a Picture" do

  context "Anonymous Users" do

    scenario "can not access the photo upload page" do

      visit new_picture_path

      expect(page).to have_content("You can not access that page")
      expect(page).to have_current_path(root_path)

    end
  end

  context "An Admin user" do

    before do 
      login_as(FactoryGirl.create(:user, :admin)) 
      visit new_picture_path
    end

    scenario "Can Upload Photos" do

      fill_in "picture[name]", with: "Test Picture"
      attach_file "picture[image]", "spec/fixtures/test.jpg"

      click_button "Upload Picture"

      expect(page).to have_content("The picture was uploaded")
      expect(page).to have_content("test.jpg")
    end

    scenario "Can't upload a photo with out a name attached to it" do

      attach_file "picture[image]", "spec/fixtures/test.jpg"

      click_button "Upload Picture"

      expect(page).to have_content("The picture was not uploaded")
      expect(page).to have_content("Name can't be blank")
    end
  end
end