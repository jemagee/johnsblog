class Article < ActiveRecord::Base

  validates :title, presence: true
  validates :abstract, presence: true, on: :update, if: Proc.new {|a| a.status == "published"}
  validates :body, presence: true, on: :update, if: Proc.new { |a| a.status == "published" }



end
