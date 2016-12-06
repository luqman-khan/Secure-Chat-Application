class AddColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :confirmation_token, :string
    add_index :users, :confirmation_token
  end
end
