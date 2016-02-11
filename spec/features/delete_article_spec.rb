require 'rails_helper'

RSpec.feature "Deleting an article" do

  let!(:article) { FactoryGirl.create(:article) }

  scenario "An article is successfully deleted" do

    visit articles_path
    click_link article.title
    click_link "Delete Article"

    expect(current_path).to eq articles_path
    expect(page).to have_content("Your article was deleted")
    expect(page).to_not have_content(article.title)
  end
end