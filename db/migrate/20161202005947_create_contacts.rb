class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.belongs_to :user, foreign_key: true, index: true
      t.integer :contact_user
      t.string :channel_key

      t.timestamps
    end
  end
end
