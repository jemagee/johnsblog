require 'rails_helper'

RSpec.feature "Adding a new article" do

  before do
    login_as(FactoryGirl.create(:user, :admin))
    visit new_admin_article_path
  end

  scenario "Entering the proper information" do
    fill_in "Title", with: "Title of Test Article"
    fill_in "Body", with: "This is the test body of the article"
    fill_in "Abstract", with: "This is the test abstract of the article"
    select "Computer", from: "article[category_id]"
    click_button "Create Article"

    expect(page).to have_content("Your article has been created")
    expect(page).to have_content("Title of Test Article")
    expect(page).to have_content("This is the test body of the article")
    expect(page).to have_content("Filed under Computer")
    expect(page).to have_content("Status: DRAFT")
    expect(page).to_not have_content("Published on:")
    expect(page).to_not have_content("#{Date.current}")
  end

  scenario "A new article, even a draft, requires a title" do
    click_button "Create Article"

    expect(page).to have_content("Your article was not created")
    expect(page).to have_content("Title can't be blank")
    expect(page).to_not have_content("Status: DRAFT")
  end

  scenario "The article processes markdown properly" do
    fill_in "Title", with: "Test Title of Article"
    fill_in "Abstract", with: "Test Abstract of article"
    select "Computer", from: "article[category_id]"
    fill_in "Body", with: "This is a test body with *markdown* so that we can **test** whether [kramdown](http://www.go.com) <b>processes</b> properly."
    click_button "Create Article"
    expect(page).to have_selector('em', text: 'markdown')
    expect(page).to have_selector('strong', text: 'test')
    expect(page).to_not have_selector('b', text: 'processes')
    expect(page).to have_link('kramdown', 'http://www.go.com')
  end
end