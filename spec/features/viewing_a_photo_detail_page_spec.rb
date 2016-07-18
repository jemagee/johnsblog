require 'rails_helper'

RSpec.feature "Viewing the details of an uploaded photo" do

  let!(:picture) { FactoryGirl.create(:picture)}

  before {login_as(FactoryGirl.create(:user, :admin)) }


  scenario "Has all the photo versions" do

    visit picture_path(picture)

    within("div#title") do
      within("h1") do
        expect(page).to have_content(picture.name)
      end
      expect(page).to have_content(picture.image.url)
    end


    within("div#thumb") do
      expect(page).to have_content(picture.image.thumb.url)
      expect(page).to have_xpath("//img[contains(@src, \"#{picture.image.thumb}\")]")
    end
  end
end