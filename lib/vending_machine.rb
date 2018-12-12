require_relative 'product_list'
require_relative 'coin_list'

class VendingMachine
  attr_reader :total_inserted
  attr_accessor :return_change, :product_list, :coin_list

  def initialize
    @total_inserted = 0
    @product_list = ProductList.new
    @coin_list = CoinList.new
  end

  def insert_money(coin)
    if coin_list.valid_coin?(coin)
      change_from_sterling = coin_list.change_to_number(coin)
      @total_inserted += change_from_sterling
    else
      raise 'Unacceptable coin denomination'
    end
  end

  def select_product(item)
    selected = product_list.products[item]
    if selected && selected[:quantity] > 0
      vend_item(selected, item)
    else
      raise 'Unavailable selection'
    end
  end

  def vend_item(selected, item)
    if selected[:price] < total_inserted
      @product_list.products[item][:quantity] -= 1
      calculate_change(selected)
      clear_balance
      "#{item} vended, #{return_change.join(" ")} returned"
    else
      amount_still_required(selected)
    end
  end

  def clear_balance
    @total_inserted = 0
  end

  def amount_still_required(selected)
    amount_still_required = selected[:price] - total_inserted
    "insert #{amount_still_required} more"
  end

  def calculate_change(selected)
    @return_change = []
    change_needed = total_inserted - selected[:price]
    sorted_coin_value = coin_list.coins.sort_by {|k,v| v[:value] }.reverse
    counter = 0
    find_neccessary_coins(sorted_coin_value, change_needed, counter)
  end

  def find_neccessary_coins(sorted_coin_value, change_needed, counter)
    while change_needed >= sorted_coin_value[counter][1][:value] && 
      sorted_coin_value[counter][1][:quantity] > 0 do 
      change_needed = change_needed - sorted_coin_value[counter][1][:value]
      sorted_coin_value[counter][1][:quantity] -= 1
      @return_change << sorted_coin_value[counter].first
    end
    counter += 1
    if counter < sorted_coin_value.length - 1
      find_neccessary_coins(sorted_coin_value, change_needed, counter)
    end
  end

  def refill_products(product_list)
    @product_list = product_list
  end

  def refill_coins(coin_list)
    @coin_list = coin_list
  end
end
