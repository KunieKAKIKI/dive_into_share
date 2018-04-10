class TeamsUser < ApplicationRecord
  belongs_to :team
  belongs_to :user

  validates :team_id, presence: true
  validates :user_id, presence: true
  validates :team_id,  uniquness: { scope: :user_id }
end
