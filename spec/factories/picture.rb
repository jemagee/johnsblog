FactoryGirl.define do
  factory :picture do
    name "Factory Girl Picture"
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, '/spec/fixtures/test.jpg'))}
  end
end