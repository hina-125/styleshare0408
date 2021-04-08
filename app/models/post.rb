class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  #serialize :image, JSON
  
  validates :image, presence: true
  validates :title, presence: true
  validates :text, presence: true
end