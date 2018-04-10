class Category < ApplicationRecord
  belongs_to :team
  has_many :posts, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
