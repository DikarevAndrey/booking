class AddSeatsCountToPlaces < ActiveRecord::Migration[5.1]
  def change
    add_column :places, :seats_count, :integer
  end
end
