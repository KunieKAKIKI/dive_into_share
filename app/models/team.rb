class Team < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
  has_many :categories, dependent: :destroy
  has_many :team_edit_rights, dependent: :destroy
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  validates :name, presence: true, uniqueness: true, length: { maximum: 30 }
  validates :description, length: { maximum: 280 }

  mount_uploader :image, ImageUploader
end
