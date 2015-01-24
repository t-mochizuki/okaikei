class ChangeColumnNull < ActiveRecord::Migration
  def change
    change_column_null :entries, :date, true
    change_column_null :entries, :comment, true
    change_column_null :credits, :name, true
    change_column_null :credits, :money, true
    change_column_null :credits, :entry_id, true
    change_column_null :debits, :name, true
    change_column_null :debits, :money, true
    change_column_null :debits, :entry_id, true
  end
end
