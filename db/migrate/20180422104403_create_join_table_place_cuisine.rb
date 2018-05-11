class CreateJoinTablePlaceCuisine < ActiveRecord::Migration[5.1]
  def change
    create_join_table :places, :cuisines do |t|
      # t.index [:place_id, :cuisine_id]
      # t.index [:cuisine_id, :place_id]
    end
  end
end
