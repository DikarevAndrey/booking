class CreateFeatures < ActiveRecord::Migration[5.1]
  def change
    create_table :features do |t|
      t.boolean :beer
      t.boolean :smoke_allowed
      t.boolean :cocktails
      t.boolean :hookah
      t.references :place, foreign_key: true

      t.timestamps
    end
  end
end
