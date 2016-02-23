class Comment < ActiveRecord::Base
  belongs_to :article
  validates :title, presence: true
  validates :body, presence: true
end
