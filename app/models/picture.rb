class Picture < ActiveRecord::Base

  validates :name, presence: true
  validates :image, presence: {message: "No file was attached"}, file_size: { less_than: 2.megabytes}

  mount_uploader :image, ImageUploader
end
