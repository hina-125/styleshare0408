class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  #serialize :image, JSON
  
  validates :image, presence: true
  validates :title, presence: true, length: { maximum: 15 }
  validates :text, presence: true, length: { maximum: 30 }
end