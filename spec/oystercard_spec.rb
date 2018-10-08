require './lib/oystercard'

describe Oystercard do

  it "checks for existance of oystercard" do
    expect(subject).to be_instance_of(Oystercard)
  end

  it 'The card has balnce of zero?' do
    expect(subject.balance).to eq 0
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'can top up the balance' do

      money = 90
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
      expect{ subject.top_up(money) }.to raise_error "Card Limit £90"
    end
  end

end
