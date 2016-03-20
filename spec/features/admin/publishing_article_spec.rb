require 'rails_helper'

RSpec.feature "Publishing an article" do

  let(:article) { FactoryGirl.create(:article)}

  before do
    login_as(FactoryGirl.create(:user, :admin))
  end

  scenario "Admin can publish an article" do

    visit article_path(article)
    click_link "Publish Article"

    expect(page).to have_content("Your article has been published")
    expect(page).to_not have_content("Status: DRAFT")
    expect(page).to_not have_link("Publish Article")
    expect(page).to have_content("Published on: #{Date.current}")
  end

  scenario "Article can not be published with a blank abstract" do
    article.update_attribute(:abstract, "")
    visit article_path(article)
    click_link "Publish Article"

    expect(page).to have_content("Your article has not been published")
    expect(page).to have_content("A published article must have an abstract")
    expect(page).to have_content("Status: DRAFT")
  end

  scenario "Article can not be published with a blank body" do
    article.update_attribute(:body, "")
    visit article_path(article)
    click_link "Publish Article"

    expect(page).to have_content("A published article must have some content")
    expect(page).to have_content("Status: DRAFT")
  end
end
