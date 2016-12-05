class CreateContact2s < ActiveRecord::Migration[5.0]
  def change
    create_table :contact2s do |t|
      t.integer :user

      t.timestamps
    end
  end
end
