class Team < ApplicationRecord
  has_many :teams_users, dependent: :destroy
  has_many :users, through: :teams_users
  has_many :categories, dependent: :destroy

  validates :name, presence: true, uniquness: true
end
