class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.integer :from, foreign_key: true
      t.integer :to
      t.text :message

      t.timestamps
    end
  end
end
