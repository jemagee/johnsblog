require 'rails_helper'

RSpec.feature "Editing a picture" do

  let!(:picture) {FactoryGirl.create(:picture)}

  before  do
    login_as(FactoryGirl.create(:user, :admin))
    visit edit_picture_path(picture)
  end

  scenario "works when changing the name" do

    fill_in "picture[name]", with: "New Picture Name"

    click_button "Update Picture"

    expect(page).to have_content("The picture was updated")
    expect(current_path).to eq picture_path(picture)
    expect(page).to have_content "New Picture Name"
  end

  scenario "works when changing the picture" do

    attach_file "picture[image]", "spec/fixtures/Fork.png"

    click_button "Update Picture"

    expect(page).to have_content("The picture was updated")
    expect(current_path).to eq picture_path(picture)
    expect(page).to have_content("Fork.png")
  end

  scenario "does not work when you use a blank name" do

    fill_in "picture[name]", with: ""

    click_button "Update Picture"

    expect(page).to have_content("The picture was not updated")
    expect(page).to have_content("Name can't be blank")
  end

  scenario "does not work when you attach too large a picture" do

    attach_file "picture[image]", "spec/fixtures/largepicture.jpg"

    click_button "Update Picture"

    expect(page).to have_content("The picture was not updated")
    expect(page).to have_content("Image file size must be less than 2 MB")
  end

  scenario "does not work when you attached the wrong file type" do

    attach_file "picture[image]", "spec/fixtures/fork.psd"

    click_button "Update Picture"

    expect(page).to have_content("The picture was not updated")
    expect(page).to have_content("File type unacceptable")
  end
end