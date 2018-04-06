class Team < ApplicationRecord
  has_many :teams_users, dependent: :destroy
  has_many :categories, dependent: :destroy
end
