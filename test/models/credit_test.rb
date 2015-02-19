require 'test_helper'

class CreditTest < ActiveSupport::TestCase
  test "A record in the database is deleted" do
    entry = Entry.create(date: Date.new(2015, 2, 19), comment: "hoge")
    entry_id = entry.id
    credit = Credit.create(name: "cname", money: 100, entry_id: entry_id)
    Debit.create(name: "dname", money: 200, entry_id: entry_id)

    credit.destroy

    assert Entry.find_by(id: entry_id)
    assert Credit.find_by(entry_id: entry_id).nil?
    assert Debit.find_by(entry_id: entry_id)
  end
end
