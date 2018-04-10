class Category < ApplicationRecord
  belongs_to :team
  has_many :posts, dependent: :destroy

  validates :name, presence: true, uniquness: true
end
