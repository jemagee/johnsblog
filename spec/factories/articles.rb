FactoryGirl.define do
  factory :article do
    sequence(:title) { |n| "This is the generic title#{n}" }
		body "This is the generic factory body from the web site and I am adding more body to it because I don't know how short I want the body minimum to be"
    abstract "This is the test abstract"

    trait :published do
      status "published"
    end

    trait :archived do
      status "archived"
    end
  end
end
