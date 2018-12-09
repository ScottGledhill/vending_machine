class VendingMachine
  attr_reader :total_inserted
  # attr_writer :total_inserted
  ACCEPTED_DENOMINATIONS = [1,2,5,10,20,50,1,2]

  def initialize
    @total_inserted = 0
  end

  def insert_money(value)
    ACCEPTED_DENOMINATIONS.include?(value) ? @total_inserted += value : nil
  end
end