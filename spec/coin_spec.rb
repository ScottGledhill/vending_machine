require 'coin_list'

describe CoinList do
  subject(:coin) { described_class.new }

  context 'possible coins' do
    it 'accepts listed' do
      expect(coin.correct_denomination?('10p')).to eq true
      expect(coin.correct_denomination?('50p')).to eq true
    end
  end

  it 'doesnt accept non listed' do
    expect(coin.correct_denomination?('30p')).to eq false
  end
end
