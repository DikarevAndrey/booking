class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :address
      t.string :subway
      t.references :city, foreign_key: true
      t.references :place, foreign_key: true
      t.timestamps
    end
  end
end
