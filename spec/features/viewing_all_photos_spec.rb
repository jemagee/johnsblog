require 'rails_helper'

RSpec.feature "The Picture Index Page" do

  let!(:photo) { FactoryGirl.create(:picture)}
  let!(:picture) { FactoryGirl.create(:picture, name: "New Picture Name")}

  before {login_as(FactoryGirl.create(:user, :admin))}

  scenario "Has all links to all photos and their thumbnails" do

    visit pictures_path

    within("div##{photo.id}") do
      within("h3") do
        expect(page).to have_content(photo.name)
      end
      expect(page).to have_link("Full Size #{photo.name}", photo.image.display.url)
      expect(page).to have_xpath("//img[contains(@src, \"#{photo.image.thumb}\")]")
    end

    within("div##{picture.id}") do
      within("h3") do
        expect(page).to have_content(picture.name)
      end
      expect(page).to have_link("Full Size #{picture.name}", picture.image.display.url)
    end
  end
end
