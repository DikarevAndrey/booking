class AddKindToPlaces < ActiveRecord::Migration[5.1]
  def change
    remove_column :places, :kind
    add_reference :places, :kind, foreign_key: true
  end
end
