class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.boolean :credit_approved, :default => false
      t.decimal :credit_limit, :precision => 8, :scale => 2, :default => 0
      t.timestamps null: false
    end
  end
end
