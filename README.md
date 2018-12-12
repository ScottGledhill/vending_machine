# Vending Machine

# Installation 

- Clone the repo at https://github.com/ScottGledhill/vending_machine
- Install/download Ruby 'https://www.ruby-lang.org/en/downloads/'
- install rspec, using 'gem install rspec'
- install bundler using 'gem install bundler'
- 'bundle install' 

To run tests use command 'rspec' in root folder

To use program:

CD into lib folder
Open IRB by typing 'irb'

-  require_relative 'vending_machine'

-  vending_machine = VendingMachine.new
![Create VendingMachine](https://github.com/ScottGledhill/vending_machine/blob/master/img/createvendingmachine.png)

-  vending_machine.insert_money("£1")
-  vending_machine.insert_money("20p")
![Insert Money](https://github.com/ScottGledhill/vending_machine/blob/master/img/insertmoney20p.png)

-  vending_machine.select_product("coke")
![Select Product](https://github.com/ScottGledhill/vending_machine/blob/master/img/selectproduct.png)
-  vending_machine.refill_products({<br>
        'baseball bat' => { price: 85, quantity: 1 },<br>
        'car' => { price: 1000, quantity: 1 },<br>
        'pikachu' => { price: 60000, quantity: 3 },<br>
        'childhood' => { price: 50, quantity: 16 },<br>
        'darth vader' => { price: 111, quantity: 3 },<br>
        'ex-partner' => { price: 1, quantity: 1100 }<br>
      })<br>
![Refill Products](https://github.com/ScottGledhill/vending_machine/blob/master/img/refillproducts.png)
- vending_machine.refill_coins({<br>
        '1p' => { quantity: 100, value: 1 },<br>
        '2p' => { quantity: 17, value: 2 },<br>
        '5p' => { quantity: 15, value: 5 },<br>
        '10p' => { quantity: 2, value: 10 },<br>
        '20p' => { quantity: 4, value: 20 },<br>
        '50p' => { quantity: 6, value: 50 },<br>
        '£1' => { quantity: 7, value: 100 },<br>
        '£2' => { quantity: 17, value: 200 }<br>
      })<br>
![Refill Coins](https://github.com/ScottGledhill/vending_machine/blob/master/img/refillcoins.png)
      
      -------------
[Scott Gledhill](https://github.com/ScottGledhill)
