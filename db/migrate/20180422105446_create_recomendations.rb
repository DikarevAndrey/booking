class CreateRecomendations < ActiveRecord::Migration[5.1]
  def change
    create_table :recomendations do |t|
      t.string :fav_type
      t.string :fav_cuisine
      t.references :user, foreign_key: true
      t.references :place, foreign_key: true

      t.timestamps
    end
  end
end
