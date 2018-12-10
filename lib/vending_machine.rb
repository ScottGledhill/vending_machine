require 'accepted_change_denominations'
require 'product'
require 'change'

class VendingMachine
  attr_reader :total_inserted, :accepted_change, :product, :change 

  def initialize
    @total_inserted = 0
    @accepted_change = AcceptedChangeDenominations
    @product = Product.new
    @change = Change.new
  end

  def insert_money(value)
    if accepted_change.correct_denomination?(value) 
      change_to_num = accepted_change.change_to_num(value)
      @total_inserted += change_to_num
    else
      false
    end
  end
end