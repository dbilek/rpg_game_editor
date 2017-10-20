class Character < ApplicationRecord
	attr_accessor :avatar_cache
  belongs_to :user
  has_many :character_attribute
  mount_uploader :avatar, AvatarUploader
  validates :name, presence: true, length: {maximum: 50}
  validates :avatar, presence: true
end
