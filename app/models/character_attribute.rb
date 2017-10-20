class CharacterAttribute < ApplicationRecord
  belongs_to :character
  mount_uploader :icon, IconUploader
end
