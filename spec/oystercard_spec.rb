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
      maximum_balance = Oystercard::MAX_BALANCE
      subject.top_up maximum_balance
      expect{ subject.top_up 1 }.to raise_error "Card Limit of #{maximum_balance} Exceeded"

    end
  end

end
