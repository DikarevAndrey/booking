class DropCuisinesPlaces < ActiveRecord::Migration[5.1]
  def change
    drop_table :cuisines_places
  end
end
