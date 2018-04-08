class Category < ApplicationRecord
  belongs_to :team
  has_many :categories, dependent: :destroy
  has_many :posts, dependent: :destroy
end
