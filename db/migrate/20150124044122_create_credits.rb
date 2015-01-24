class CreateCredits < ActiveRecord::Migration
  def change
    create_table :credits do |t|
      t.string :name
      t.integer :money
      t.integer :entry_id

      t.timestamps null: false
    end
  end
end
