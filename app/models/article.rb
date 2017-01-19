class Article < ActiveRecord::Base

  attr_accessor :tag_names

  belongs_to :category
  has_many :comments
  has_and_belongs_to_many :tags


  scope :published, -> {where(status: "published").order(published_on: :desc)}
  scope :drafts, -> {where(status: "draft").order(updated_at: :desc)}
  
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

  def draft? 
    self.status = "draft"
  end

  def tag_names=(names)
    @tag_names = names
    names.split(",").each do |name|
      self.tags << Tag.find_or_initialize_by(name: name)
    end
  end

end
