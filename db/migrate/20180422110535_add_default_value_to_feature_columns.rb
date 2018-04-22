class AddDefaultValueToFeatureColumns < ActiveRecord::Migration[5.1]
  def change
    change_column :features, :beer, :boolean, default: false
    change_column :features, :smoke_allowed, :boolean, default: false
    change_column :features, :cocktails, :boolean, default: false
    change_column :features, :hookah, :boolean, default: false
  end
end
