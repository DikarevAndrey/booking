class CreateSubways < ActiveRecord::Migration[5.1]
  def change
    create_table :subways do |t|
      t.references :city, foreign_key: true
      t.string :name

      t.timestamps
    end
    remove_column :locations, :subway
    remove_column :locations, :city_id
    add_reference :locations, :subway, foreign_key: true
  end
end
