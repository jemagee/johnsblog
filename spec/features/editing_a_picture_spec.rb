require 'rails_helper'

RSpec.feature "Editing a picture" do

  let!(:picture) {FactoryGirl.create(:picture)}

  before  do
    login_as(FactoryGirl.create(:user, :admin))
    visit edit_picture_path(picture)
  end

  scenario "It works when changing the name" do

    fill_in "picture[name]", with: "New Picutre Name"

    click_button "Update Picture"

    expect(page).to have_content("The picture was updated")
    expect(current_path).to eq picture_path(picture)
  end
end