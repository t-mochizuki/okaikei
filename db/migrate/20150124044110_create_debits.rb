class CreateDebits < ActiveRecord::Migration
  def change
    create_table :debits do |t|
      t.string :name
      t.integer :money
      t.integer :entry_id

      t.timestamps null: false
    end
  end
end
