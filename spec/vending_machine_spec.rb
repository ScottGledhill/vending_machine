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
      vending_machine.insert_money('£1')
      expect(vending_machine.select_product('coke')).to eq '20p change'
    end
  end

  context 'changes quantity of product list' do
    it 'on acceptable selection' do
      vending_machine.insert_money('£1')
      vending_machine.select_product('coke')
      expect(vending_machine.product_list.products['coke'][:quantity]).to eq 4
    end
  end

  context 'doesnt accept' do
    it 'incorrect selections' do
      vending_machine.insert_money('£1')
      expect(vending_machine.select_product('dog')).to eq "unavailable selection"
      # expect {vending_machine.select_product('dog')}.to raise_error("unavailable selection")
    end
  end
end