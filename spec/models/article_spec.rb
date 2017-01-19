require 'rails_helper'

RSpec.describe Article, type: :model do
  it {should validate_presence_of(:title)}
  it {should belong_to(:category)}
  it {should have_many(:comments)}
  it {should have_and_belong_to_many(:tags)}
end
