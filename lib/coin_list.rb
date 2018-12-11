class CoinList
  attr_reader :coins

  def initialize(coins = {
    '1p' => { quantity: 10, value: 1 },
    '2p' => { quantity: 10, value: 2 },
    '5p' => { quantity: 10, value: 5 },
    '10p' => { quantity: 10, value: 10 },
    '20p' => { quantity: 10, value: 20 },
    '50p' => { quantity: 10, value: 50 },
    '£1' => { quantity: 10, value: 100 },
    '£2' => { quantity: 0, value: 200 }
  })
    @coins = coins
  end

  def valid_coin?(coin)
    coins.has_key?(coin)
  end

  def change_to_number(value)
    coins[value][:value]
  end
end
