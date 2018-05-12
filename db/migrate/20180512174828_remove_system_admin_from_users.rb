class RemoveSystemAdminFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :system_admin
  end
end
