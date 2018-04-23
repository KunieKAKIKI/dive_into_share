class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :memberships, dependent: :destroy
  has_many :teams, through: :memberships
  has_many :posts
  has_many :comments
  
  has_many :team_edit_rights, dependent: :destroy

  validates :name, presence: true, length: { maximum: 30 }
  validates :description, length: { maximum: 280 }

  mount_uploader :image, ImageUploader

  def can_comment?(post)
    teams.exists?(id: post.category.team.id)
  end

  def can_delete_comment?(comment)
    self == comment.user
  end

  def can_see?(other_user)
    teams.where(id: other_user.teams.ids).present?
  end
end
