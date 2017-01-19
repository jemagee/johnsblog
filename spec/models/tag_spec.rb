require 'rails_helper'

RSpec.describe Tag, type: :model do
  it{should validate_presence_of(:name)}
  it{should validate_uniqueness_of(:name).case_insensitive}
  it{should have_and_belong_to_many(:articles)}
end
