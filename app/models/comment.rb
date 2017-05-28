class Comment < ActiveRecord::Base

	attr_accessor :email

  before_save :clean_comment
  belongs_to :article
  validates :body, presence: true

  scope :admin_home, -> {order(created_at: :desc).limit(10)}

  def clean_comment
    sanitizer = Rails::Html::FullSanitizer.new
    self.body = sanitizer.sanitize(self.body)
  end
end
