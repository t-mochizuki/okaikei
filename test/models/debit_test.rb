require 'test_helper'

class DebitTest < ActiveSupport::TestCase
  test "A record in the database is deleted" do
    entry = Entry.create(date: Date.new(2015, 2, 19), comment: "hoge")
    entry_id = entry.id
    Credit.create(name: "cname", money: 100, entry_id: entry_id)
    debit = Debit.create(name: "dname", money: 200, entry_id: entry_id)

    debit.destroy

    assert Entry.find_by(id: entry_id)
    assert Credit.find_by(entry_id: entry_id)
    assert Debit.find_by(entry_id: entry_id).nil?
  end
end
