class Picture < ActiveRecord::Base

  validates :name, presence: true
  validates :image, presence: {message: "No file was attached"}

  mount_uploader :image, ImageUploader
end
