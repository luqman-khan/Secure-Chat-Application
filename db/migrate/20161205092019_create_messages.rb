class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.integer :from, foreign_key: true
      t.integer :to
      t.belongs_to :contact, foreign_key: :channel_key
      t.text :message

      t.timestamps
    end
  end
end
