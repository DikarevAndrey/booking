class CreatePlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :places do |t|
      t.string :type, :null => false
      t.string :name, :null => false
      t.integer :min_age, :null => false, :default => 0
      t.string :open_hours
      t.integer :avg_bill
      t.text :description

      t.timestamps
    end
  end
end
