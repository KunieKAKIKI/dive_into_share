class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :teams_users, dependent: :destroy
  has_many :teams, through: :teams_users
  has_many :posts
  has_many :comments

  validates :name, presence: true
end
