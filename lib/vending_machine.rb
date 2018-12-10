require 'accepted_change_denominations'
require 'product'
require 'change'

class VendingMachine
  attr_reader :total_inserted, :accepted_change, :product_list, :change 

  def initialize
    @total_inserted = 0
    @accepted_change = AcceptedChangeDenominations
    @product_list = Product.new
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

  def select_product(item)
    selected = product_list.products[item]
    if selected
      selected[:price] < total_inserted ? @product_list.products[item][:quantity] -= 1 : 'mo mney pls bbz'
    else
      'unavailable selection'
    end
    # go into product list make sure it matches, if so check enough total inserted, 
    # remove 1 from quantity, if < total inserted, return change, reset inserted to 0
  end

  def calculate_change(selected)
    # recursive change calc?
  end
end