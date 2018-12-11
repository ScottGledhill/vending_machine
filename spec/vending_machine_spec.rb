require 'vending_machine'

describe VendingMachine do
  subject(:vending_machine) { described_class.new }

  context 'on creation' do
    it 'initializes with total inserted at 0' do
      expect(vending_machine.total_inserted).to eq 0
    end
  end

  context 'accepts input' do
    it 'of valid coins' do
      vending_machine.insert_money('10p')
      expect(vending_machine.total_inserted).to eq 10
    end
  end

  context 'returns change' do
    it 'if too much money for product' do
      selected = vending_machine.product_list.products['coke']
      vending_machine.insert_money('£2')
      vending_machine.calculate_change(selected)
      expect(vending_machine.return_change).to eq ['£1', '20p']
    end

    it 'returns multiple amounts of same coin if neccessary' do
      selected = vending_machine.product_list.products['apple']
      vending_machine.insert_money('£1')
      vending_machine.calculate_change(selected)
      expect(vending_machine.return_change).to eq ['20p','20p']
    end
  end

  context 'quantity changes' do
    it 'when coin is given, coin quantity is reduced' do
      selected = vending_machine.product_list.products['apple']
      vending_machine.insert_money('£1')
      vending_machine.calculate_change(selected)
      expect(vending_machine.coin_list.coins['20p'][:quantity]).to eq 8
    end
  end

  context 'on acceptable selection' do
    it 'changes product quantity' do
      vending_machine.insert_money('£1')
      vending_machine.select_product('coke')
      expect(vending_machine.product_list.products['coke'][:quantity]).to eq 4
    end

    it 'changes total inserted to 0' do
      vending_machine.insert_money('£1')
      vending_machine.select_product('coke')
      expect(vending_machine.total_inserted).to eq 0
    end
  end

  context 'unacceptable selections' do
    it 'product' do
      vending_machine.insert_money('£1')
      expect { vending_machine.select_product('dog') }.to raise_error('Unavailable selection')
    end

    it 'coin denominations' do
      expect { vending_machine.insert_money('99') }.to raise_error("Unacceptable coin denomination")
    end

    it 'not enough money input' do
      vending_machine.insert_money('10p')
      expect(vending_machine.select_product('crisps')).to eq 'insert 40 more'
    end

    # it 'not enough coins left' do
    #   vending_machine.refill_coins(coins = 
    #     { '1p' => { quantity: 0, value: 1 },
    #       '10p' => { quantity: 2, value: 10 } })
    #   expect(vending_machine.select_product('crisps')).to eq 'insert 40 more'
    # end

  #   it 'not enough product left' do
  #     vending_machine.refill_products((products = {
  #       'coke' => { price: 80, quantity: 0 },
  #       'lemonade' => { price: 100, quantity: 5 },
  #       'beer' => { price: 300, quantity: 10 },
  #       'crisps' => { price: 50, quantity: 6 },
  #       'apple' => { price: 60, quantity: 10 },
  #       'chocolate' => { price: 90, quantity: 10 }
  #     }))
  #     expect{ vending_machine.select_product('coke') }.to raise_error('Unavailable selection')
  #   end
  end

  context 'refill' do
    it 'products' do
      vending_machine.refill_products((products = {
        'baseball bat' => { price: 85, quantity: 1 },
        'car' => { price: 1000, quantity: 1 },
        'pikachu' => { price: 60000, quantity: 3 },
        'childhood' => { price: 50, quantity: 16 },
        'darth vader' => { price: 111, quantity: 3 },
        'ex-partner' => { price: 1, quantity: 1100 }
      }))
      expect(vending_machine.product_list).to eq products = {
        'baseball bat' => { price: 85, quantity: 1 },
        'car' => { price: 1000, quantity: 1 },
        'pikachu' => { price: 60000, quantity: 3 },
        'childhood' => { price: 50, quantity: 16 },
        'darth vader' => { price: 111, quantity: 3 },
        'ex-partner' => { price: 1, quantity: 1100 }
      }
    end

    it 'coins' do
      vending_machine.refill_coins((coins = {
        '1p' => { quantity: 100, value: 1 },
        '2p' => { quantity: 17, value: 2 },
        '5p' => { quantity: 15, value: 5 },
        '10p' => { quantity: 2, value: 10 },
        '20p' => { quantity: 4, value: 20 },
        '50p' => { quantity: 6, value: 50 },
        '£1' => { quantity: 7, value: 100 },
        '£2' => { quantity: 17, value: 200 }
      }))
      expect(vending_machine.coin_list).to eq coins = {
        '1p' => { quantity: 100, value: 1 },
        '2p' => { quantity: 17, value: 2 },
        '5p' => { quantity: 15, value: 5 },
        '10p' => { quantity: 2, value: 10 },
        '20p' => { quantity: 4, value: 20 },
        '50p' => { quantity: 6, value: 50 },
        '£1' => { quantity: 7, value: 100 },
        '£2' => { quantity: 17, value: 200 }
      }
    end
  end
end