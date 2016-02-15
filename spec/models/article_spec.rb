require 'rails_helper'

RSpec.describe Article, type: :model do
  it {should validate_presence_of(:title)}
  it {should belong_to(:category)}
end
