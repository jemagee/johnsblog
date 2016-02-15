class Article < ActiveRecord::Base
  belongs_to :category

  validates :title, presence: true
 # validates :abstract, presence: true, on: :update, if: Proc.new {|a| a.status == "published"}
 # validates :body, presence: true, on: :update, if: Proc.new { |a| a.status == "published" }
  with_options if: Proc.new { |a| a.status == "published" }, on: :update do |article|
    article.validates :abstract, presence: true
    article.validates :body, presence: true
  end




end
