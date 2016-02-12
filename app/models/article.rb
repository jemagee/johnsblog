class Article < ActiveRecord::Base

  validates :title, presence: true
  validates :abstract, presence: true, on: :update, :if => :publishable

  def publishable
    changed.include?("status") && status == "published"
  end
end
