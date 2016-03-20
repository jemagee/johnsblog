class Article < ActiveRecord::Base
  belongs_to :category
  has_many :comments

  before_save :set_publication_date,
    if: Proc.new { |article| article.published? && article.published_on.nil? }

  validates :title, presence: true
 # validates :abstract, presence: true, on: :update, if: Proc.new {|a| a.status == "published"}
 # validates :body, presence: true, on: :update, if: Proc.new { |a| a.status == "published" }
  with_options if: Proc.new { |a| a.status == "published" }, on: :update do |article|
    article.validates :abstract, presence:  { message:  'A published article must have an abstract' }
    article.validates :body, presence: { message: "A published article must have some content" }
  end

  def published?
  	self.status == "published"
  end

  def set_publication_date
    self.published_on = Date.current
  end

end
