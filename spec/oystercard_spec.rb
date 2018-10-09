require './lib/oystercard'

describe Oystercard do

  it "checks for existance of oystercard" do
    expect(subject).to be_instance_of(Oystercard)
  end

  it 'The card has balance of zero?' do
    expect(subject.balance).to eq 0
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'Raise error after top up limit exceeded' do
      maximum_balance = Oystercard::MAX_BALANCE
      subject.top_up maximum_balance
      expect{ subject.top_up 1 }.to raise_error "Card Limit of #{maximum_balance} Exceeded"
    end

    it 'Can top_up and check balance' do
      expect{ subject.top_up(1)}.to change{ subject.balance}.by 1
    end
  end

  # describe '#deduct' do
  #   it { is_expected.to respond_to(:deduct).with(1).argument }
  #
  #   it 'Can deduct from balance' do
  #     expect{ subject.deduct(1) }.to change{ subject.balance}.by -1
  #   end
  # end

  describe '#touch_in' do
    it { is_expected.to respond_to(:touch_in) }

    it 'Raises error if below minimum balance' do
      expect{subject.touch_in}.to raise_error("Error: balance below minimum")
    end
  end

  describe '#touch_out' do
    it { is_expected.to respond_to(:touch_out) }

    it 'Deduct fare after touching out' do
      subject.top_up(10)
      subject.touch_in
      expect{subject.touch_out}.to change{ subject.balance}.by -Oystercard::MIN_BALANCE
    end


  end

  describe '#in_journey?' do
    it { is_expected.to respond_to(:in_journey?) }

    it 'returns false when initiated' do
      expect(subject.in_journey?).to eq(false)
    end

    it 'returns true after touching in' do
      subject.top_up 10
      subject.touch_in
      expect(subject.in_journey?).to eq(true)
    end

    it 'returns false after touching out' do
      subject.top_up 10
      subject.touch_in
      subject.touch_out
      expect(subject.in_journey?).to eq(false)
    end
  end

end
