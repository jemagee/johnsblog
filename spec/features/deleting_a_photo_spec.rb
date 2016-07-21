require 'rails_helper'

RSpec.feature "Deleting a photo" do

  let!(:picture) {FactoryGirl.create(:picture)}
  let!(:picture2) {FactoryGirl.create(:picture, name: "Second Picture")}

  before {login_as(FactoryGirl.create(:user, :admin))}

  scenario "Works properly" do

    visit picture_path(picture)
    click_link "Delete Photo"

    expect(page).to have_content("The photo was deleted")
    expect(current_path).to eq pictures_path
    expect(page).to_not have_content(picture.name)
    expect(page).to have_content(picture2.name)
  end
end