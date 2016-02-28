require 'rails_helper'

RSpec.feature "Deleting an article" do

  let!(:article) { FactoryGirl.create(:article) }

  before do
    login_as(FactoryGirl.create(:user, :admin))
  end

  scenario "An article is successfully deleted" do

    visit admin_article_path(article)
    click_link "Delete Article"

    expect(current_path).to eq articles_path
    expect(page).to have_content("Your article was deleted")
    expect(page).to_not have_content(article.title)
  end
end