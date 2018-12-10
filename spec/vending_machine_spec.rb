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
      p vending_machine
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

  # context '' do
  #   it 'if too much money for product' do
  #     vending_machine.insert_money('£1')
  #     expect(vending_machine.select_product('coke')).to eq '20p change'
  #   end
  # end

  context 'doesnt accept' do
    it 'incorrect selections' do
      vending_machine.insert_money('£1')
      expect(vending_machine.select_product('dog')).to eq "unavailable selection"
      # expect {vending_machine.select_product('dog')}.to raise_error("unavailable selection")
    end
  end
end