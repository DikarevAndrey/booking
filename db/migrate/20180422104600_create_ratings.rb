class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.integer :points, :null => false, :default => 0
      t.integer :stars, :null => false, :default => 0
      t.references :place, foreign_key: true

      t.timestamps
    end
  end
end
