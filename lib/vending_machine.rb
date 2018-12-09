class VendingMachine
  attr_reader :total_inserted
  ACCEPTED_DENOMINATIONS = [1,2,5,10,20,50,1,2]

  def initialize
    @total_inserted = 0
  end 
end