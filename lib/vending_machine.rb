require 'accepted_change_denominations'
require 'product'
require 'coins'

class VendingMachine
  attr_reader :total_inserted, :accepted_change, :product_list, :coins
  attr_accessor :return_change

  def initialize
    @total_inserted = 0
    @accepted_change = AcceptedChangeDenominations
    @product_list = Product.new
    @coins = Coins.new
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
      if selected[:price] < total_inserted
        @product_list.products[item][:quantity] -= 1
        calculate_change(selected)
        @total_inserted = 0
      else
        amount_still_required = selected[:price] - @total_inserted
        "insert #{amount_still_required} more"
      end
    else
      'unavailable selection'
    end
    # go into product list make sure it matches, if so check enough total inserted,
    # remove 1 from quantity, if < total inserted, return change, reset inserted to 0
  end

  def calculate_change(selected)
    @return_change = []
    price = selected[:price] #80
    change_needed = total_inserted - price #120
    
    sorted_coin_value = coins.coin_list.sort_by {|k,v| v[:value] }.reverse
    i = 0
    while i < sorted_coin_value.length - 1 do 
      if change_needed >= sorted_coin_value[i][1][:value] && change_needed > 0
        p change_needed = change_needed - sorted_coin_value[i][1][:value]
        @return_change << sorted_coin_value[i].first
      end
      i += 1
    end
    p @return_change
  end
    # loop through check if largest coin denom can fit in selected, check again until it cant
    # loop through check if second largest, loop through until it cant
    # loop through check if third largest etc
    # recursive change calc?
end