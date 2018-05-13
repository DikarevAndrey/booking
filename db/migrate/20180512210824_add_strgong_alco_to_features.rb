class AddStrgongAlcoToFeatures < ActiveRecord::Migration[5.1]
  def change
    add_column :features, :strong_alco, :boolean, default: false
  end
end
