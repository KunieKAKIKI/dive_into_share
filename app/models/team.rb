class Team < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
  has_many :categories, dependent: :destroy

  validates :name, presence: true, uniqueness: true, length: { maximum: 30 }
  validates :description, length: { maximum: 280 }
end
