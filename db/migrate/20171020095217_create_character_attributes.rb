class CreateCharacterAttributes < ActiveRecord::Migration[5.0]
  def change
    create_table :character_attributes do |t|
      t.string :name
      t.integer :intensity
      t.string :icon
      t.references :character, foreign_key: true

      t.timestamps
    end
  end
end
