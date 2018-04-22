class AddDetailsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :born_date, :date
    add_column :users, :tel_number, :string
    add_column :users, :admin, :boolean, default: false
  end
end
