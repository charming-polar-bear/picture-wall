class AddDetailsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :account_name, :string
    add_column :users, :account_avatar, :string
    add_column :users, :account_back_ground, :string
    add_column :users, :phone, :integer
    add_column :users, :signature, :text
  end
end
