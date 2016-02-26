class Category < ActiveRecord::Base
  has_many :articles

  validates :name, presence: true, uniqueness: { case_sensitive: false, message: "This category already exists"}
end
