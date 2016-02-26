require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should validate_presence_of(:name)}
  it { should validate_uniqueness_of(:name).case_insensitive.with_message("This category already exists")}
  it { should have_many(:articles)}
end
