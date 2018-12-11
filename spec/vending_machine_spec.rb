require 'vending_machine'

describe VendingMachine do
  subject(:vending_machine) {described_class.new}

  context 'on creation' do
    it 'initializes with coordinates at 0,0' do
      expect(vending_machine.total_inserted).to eq 0
    end
  end

  context 'accepts input' do
    it '10p' do
      vending_machine.insert_money('10p')
      expect(vending_machine.total_inserted).to eq 10
    end
  end

  context 'returns change' do
    it 'if too much money for product' do
      selected = vending_machine.product_list.products['coke']
      vending_machine.insert_money('£2')
      expect(vending_machine.calculate_change(selected)).to eq ['£1', '20p']
    end

    it 'returns multiple amounts of same coin if neccessary' do
      selected = vending_machine.product_list.products['apple']
      vending_machine.insert_money('£1')
      expect(vending_machine.calculate_change(selected)).to eq ['20p', '20p']
    end
  end

  context 'quantity changes' do
    it 'when coin is given, coin quantity is reduced' do
      selected = vending_machine.product_list.products['apple']
      vending_machine.insert_money('£1')
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

  context 'doesnt accept' do
    it 'incorrect selections' do
      vending_machine.insert_money('£1')
      expect(vending_machine.select_product('dog')).to eq 'unavailable selection'
      # expect {vending_machine.select_product('dog')}.to raise_error("unavailable selection")
    end

    it 'not enough money input' do
      vending_machine.insert_money('10p')
      expect(vending_machine.select_product('crisps')).to eq 'insert 40 more'
    end
  end
end