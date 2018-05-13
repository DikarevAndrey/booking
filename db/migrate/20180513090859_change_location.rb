class ChangeLocation < ActiveRecord::Migration[5.1]
  def change
    remove_column :subways, :city_id
    add_reference :locations, :city, foreign_key: true
  end
end
