class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  #serialize :image, JSON
  
  #validates :content, presence: true, length: { maximum: 255 }
end