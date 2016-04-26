class Comment < ActiveRecord::Base

  before_save :clean_comment
  belongs_to :article
  validates :body, presence: true

  def clean_comment
    sanitizer = Rails::Html::FullSanitizer.new
    self.body = sanitizer.sanitize(self.body)
  end
end
