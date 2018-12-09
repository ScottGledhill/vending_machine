require 'vending_machine'

describe VendingMachine do
  subject(:vending_machine) {described_class.new}

  context 'on creation' do
    it 'initializes with coordinates at 0,0' do
      expect(vending_machine.total_inserted).to eq 0
    end
  end
end