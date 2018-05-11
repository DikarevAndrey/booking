class CreateOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :offers do |t|
      t.string :name
      t.boolean :is_active
      t.text :content
      t.references :place, foreign_key: true

      t.timestamps
    end
  end
end
