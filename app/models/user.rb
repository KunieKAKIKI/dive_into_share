class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :teams_users, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
end
