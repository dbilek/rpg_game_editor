class Character < ApplicationRecord
	attr_accessor :avatar_cache
  belongs_to :user
  mount_uploader :avatar, AvatarUploader
  validates :name, presence: true, length: {maximum: 50}
  validates :avatar, presence: true
end
