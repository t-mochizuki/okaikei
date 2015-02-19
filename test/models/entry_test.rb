require 'test_helper'

class EntryTest < ActiveSupport::TestCase
  test "Records in the database is deleted" do
    entry = Entry.create
    entry_id = entry.id
    entry.date = Date.new(2015, 2, 19)
    entry.comment = "hoge"
    entry.save

    credit = Credit.create
    credit.name = "cname"
    credit.money = 100
    credit.entry_id = entry_id
    credit.save

    debit = Debit.create
    debit.name = "dname"
    debit.money = 200
    debit.entry_id = entry_id
    debit.save

    entry.destroy
    assert Entry.find_by(id: entry_id).nil?
    assert Credit.find_by(entry_id: entry_id).nil?
    assert Debit.find_by(entry_id: entry_id).nil?
  end
end
