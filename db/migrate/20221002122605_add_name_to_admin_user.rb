class AddNameToAdminUser < ActiveRecord::Migration[6.1]
  def change
    add_column :admin_users, :name, :string, null: false
  end
end
