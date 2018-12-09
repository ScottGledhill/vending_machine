require 'accepted_change_denominations'

describe AcceptedChangeDenominations do
  subject(:accepted_change) {described_class}

  context 'denominations' do
    it 'accepts listed' do
      expect(accepted_change.correct_denomination?('10p')).to eq true
      expect(accepted_change.correct_denomination?('50p')).to eq true  
    end
  end

  it 'doesnt accept non listed' do
    expect(accepted_change.correct_denomination?('30p')).to eq false 
  end
end