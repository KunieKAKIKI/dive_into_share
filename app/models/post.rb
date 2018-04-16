class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { maximum: 30 }
  validates :content, presence: true, length: { maximum: 400 }
  mount_uploader :image, ImageUploader
end
