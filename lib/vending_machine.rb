require 'accepted_change_denominations'

class VendingMachine
  attr_reader :total_inserted, :accepted_change

  def initialize
    @total_inserted = 0
    @accepted_change = AcceptedChangeDenominations
  end

  def insert_money(value)
    if accepted_change.correct_denomination?(value) 
      change_num = accepted_change.change_to_num(value)
      @total_inserted += change_num
    else
      false
    end
  end
end