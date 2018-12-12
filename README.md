- Install/download Ruby 'https://www.ruby-lang.org/en/downloads/'
- install rspec, using 'gem install rspec'
- install bundler using 'gem install bundler'
- 'bundle install' 

to run tests use command 'rspec' in root folder

to use program:

go into lib folder
open IRB by typing 'irb'

-  require_relative 'vending_machine'
-  vending_machine = VendingMachine.new
-  vending_machine.insert_money("20p")
-  vending_machine.insert_money("£1")
-  vending_machine.select_product("coke")
-  vending_machine.refill_products({
        'baseball bat' => { price: 85, quantity: 1 },
        'car' => { price: 1000, quantity: 1 },
        'pikachu' => { price: 60000, quantity: 3 },
        'childhood' => { price: 50, quantity: 16 },
        'darth vader' => { price: 111, quantity: 3 },
        'ex-partner' => { price: 1, quantity: 1100 }
      })
- vending_machine.refill_coins({
        '1p' => { quantity: 100, value: 1 },
        '2p' => { quantity: 17, value: 2 },
        '5p' => { quantity: 15, value: 5 },
        '10p' => { quantity: 2, value: 10 },
        '20p' => { quantity: 4, value: 20 },
        '50p' => { quantity: 6, value: 50 },
        '£1' => { quantity: 7, value: 100 },
        '£2' => { quantity: 17, value: 200 }
      })
