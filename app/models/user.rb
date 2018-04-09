class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, UserImageUploader

  has_many :prototypes
  has_many :likes, dependent: :destroy
  has_many :liked_prototypes, through: :likes, source: :prototype

  validates :name, presence: true
end
