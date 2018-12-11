require 'product'
require 'coin'

class VendingMachine
  attr_reader :total_inserted, :product_list, :coin_list
  attr_accessor :return_change

  def initialize
    @total_inserted = 0
    @product_list = Product.new
    @coin_list = Coin.new
  end

  def insert_money(value)
    if coin_list.correct_denomination?(value) 
      change_to_num = coin_list.change_to_num(value)
      @total_inserted += change_to_num
    else
      raise 'Unacceptable coin denomination'
    end
  end

  def select_product(item)
    selected = product_list.products[item]
    if selected
      if selected[:price] < total_inserted
        @product_list.products[item][:quantity] -= 1
        calculate_change(selected)
        @total_inserted = 0
        "#{item} vended, #{return_change.join} returned"
      else
        amount_still_required = selected[:price] - @total_inserted
        "insert #{amount_still_required} more"
      end
    else
      raise 'Unavailable selection'
    end
  end

  def calculate_change(selected)
    @return_change = []
    change_needed = total_inserted - selected[:price]
    sorted_coin_value = coin_list.coins.sort_by {|k,v| v[:value] }.reverse
    i = 0
    check_change(sorted_coin_value, change_needed, i)
  end

  def check_change(sorted_coin_value, change_needed, i)
    while change_needed >= sorted_coin_value[i][1][:value] do 
      change_needed = change_needed - sorted_coin_value[i][1][:value]
      sorted_coin_value[i][1][:quantity] -= 1
      @return_change << sorted_coin_value[i].first
    end
    i += 1
    if i < sorted_coin_value.length - 1
      check_change(sorted_coin_value, change_needed, i)
    end
  end
end