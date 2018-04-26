class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_one :team, through: :category

  validates :title, presence: true, length: { maximum: 30 }
  validates :content, presence: true, length: { maximum: 400 }

  scope :accessible, ->(user) do
    Post.joins(category: :team).where(teams: { id: user.teams.ids })
  end
end
