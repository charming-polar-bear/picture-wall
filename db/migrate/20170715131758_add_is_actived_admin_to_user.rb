class AddIsActivedAdminToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :is_actived_admin, :boolean, default: false
  end
end
