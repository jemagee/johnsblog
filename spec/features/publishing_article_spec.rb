require 'rails_helper'

RSpec.feature "Publishing an article" do

  let(:article) { FactoryGirl.create(:article)}

  scenario "User can publish an article" do

    visit article_path(article)
    click_link "Publish Article"

    expect(page).to have_content("Your article has been published")
    expect(page).to_not have_content("Status: DRAFT")
    expect(page).to_not have_link("Publish Article")
  end
end
