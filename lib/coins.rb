class Coins
  attr_reader :coins
  
  def initialize(coins = {
    '1p' => { quantity: 10, value: 1 },
    '2p' => { quantity: 10, value: 2 },
    '5p' => { quantity: 10, value: 5 },
    '10p' => { quantity: 10, value: 10 },
    '20p' => { quantity: 10, value: 20 },
    '50p' => { quantity: 10, value: 50 },
    '£1' => { quantity: 10, value: 100 },
    '£2' => { quantity: 1, value: 200 }
  })
  @coins = coins
  end
end