require 'coin_list'

describe CoinList do
  subject(:coin) { described_class.new }

  context 'possible coins' do
    it 'accepts listed' do
      expect(coin.valid_coin?('10p')).to eq true
      expect(coin.valid_coin?('50p')).to eq true
    end
  end

  it 'doesnt accept non listed' do
    expect(coin.valid_coin?('30p')).to eq false
  end
end
