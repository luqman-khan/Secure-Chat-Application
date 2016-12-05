class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.belongs_to :user
      t.integer :contact_user
      t.string :channel_key

      t.timestamps
    end
  end
end
