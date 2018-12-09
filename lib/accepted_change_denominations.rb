module AcceptedChangeDenominations
  DENOMINATIONS = {  
    '1p' => 1,
    '2p' => 2,
    '5p' => 5,
    '10p' => 10,
    '20p' => 20,
    '50p' => 50,
    '£1' => 100,
    '£2' => 200
  }

  def self.correct_denomination?(value)
    DENOMINATIONS.has_key?(value)
  end

  def self.change_to_num(value)
    DENOMINATIONS[value]
  end
end