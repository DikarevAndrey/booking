class ChangeRecomendation < ActiveRecord::Migration[5.1]
  def change
    remove_column :recomendations, :fav_type
    remove_column :recomendations, :fav_cuisine
    add_reference :recomendations, :kind, foreign_key: true
    add_reference :recomendations, :cuisine, foreign_key: true
  end
end
