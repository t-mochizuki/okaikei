class Entry < ActiveRecord::Base
  has_many :credits, :foreign_key => "entry_id", :dependent => :destroy
  accepts_nested_attributes_for :credits
  has_many :debits, :foreign_key => "entry_id", :dependent => :destroy
  accepts_nested_attributes_for :debits
end
