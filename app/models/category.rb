class Category < ApplicationRecord
  belongs_to :team
  has_many :posts, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :team }, length: { maximum: 30 }
  validates :description, length: { maximum: 280 }

  mount_uploader :image, ImageUploader
end
