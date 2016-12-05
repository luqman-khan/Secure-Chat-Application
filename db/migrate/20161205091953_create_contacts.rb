class CreateContact1s < ActiveRecord::Migration[5.0]
  def change
    create_table :contact1s do |t|
      t.integer :user

      t.timestamps
    end
  end
end
