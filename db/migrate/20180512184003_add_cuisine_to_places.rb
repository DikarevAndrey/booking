class AddCuisineToPlaces < ActiveRecord::Migration[5.1]
  def change
    add_reference :places, :cuisine, foreign_key: true
  end
end
