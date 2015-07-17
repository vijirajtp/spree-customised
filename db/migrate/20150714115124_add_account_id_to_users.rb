class AddAccountIdToUsers < ActiveRecord::Migration
  def change
  	add_column :spree_users, :account_id, :integer
  end
end
