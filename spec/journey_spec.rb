require 'journey'

describe Journey do

  let(:station) { double(:station) }
  let(:station2) { double(:station) }
  let(:card) { double(:card)}

  describe '#touch_in' do
    it { is_expected.to respond_to(:touch_in).with(2).argument }

    it 'Raises error if below minimum balance' do
      expect{subject.touch_in(station, 0)}.to raise_error("Error: balance below minimum")
    end

    it 'shows entry station' do
      subject.touch_in(station, 10)
      expect(subject.entry_station).to eq(station)
    end

  end

  describe '#touch_out' do
    it { is_expected.to respond_to(:touch_out).with(1).argument }

    # it 'Deducts fare after touching out' do
    #   subject.touch_in(station, 10)
    #   expect{subject.touch_out(station2)}.to change{ subject.balance}.by -Oystercard::MIN_BALANCE
    # end

    it 'Forgets entry station after touching out' do
      subject.touch_in(station, 10)
      subject.touch_out(station2)
      expect(subject.entry_station).to eq nil
    end

    it 'Remembers the exit station after touching out' do
      subject.touch_in(station, 10)
      subject.touch_out(station2)
      expect(subject.exit_station).to eq(station2)
    end


  end

  describe '#in_journey?' do
    it { is_expected.to respond_to(:in_journey?) }

    it 'returns false when initiated' do
      expect(subject.in_journey?).to eq(false)
    end

    it 'returns true after touching in' do
      subject.touch_in(station, 10)
      expect(subject.in_journey?).to eq(true)
    end

    it 'returns false after touching out' do
      subject.touch_in(station, 10)
      subject.touch_out(station2)
      expect(subject.in_journey?).to eq(false)
    end
  end

  describe 'journey history' do
    it 'returns a hash of previous journey' do
      subject.touch_in(station, 10)
      subject.touch_out(station2)
      expect(subject.previous_journey).to eq({entry_station: station, exit_station: station2 })
    end

    it 'initialises with an empty list of journeys' do
      expect(subject.all_journeys).to eq([])
    end

    it 'Adds previous journey to all journeys array' do
      subject.touch_in(station, 10)
      subject.touch_out(station2)
      expect(subject.all_journeys).to include(subject.previous_journey)
    end

  end

  describe '#fare' do
    it 'returns minimum value for complete journey' do
      subject.touch_in(station, 10)
      subject.touch_out(station2)
      expect(subject.fare).to eq Oystercard::MIN_BALANCE
    end

    # it 'returns 6 for not touching out' do
    #   subject.touch_in(station, 10)
    #   expect(subject.fare).to eq(6)
    # end
    #
    # it 'returns 6 for not touching in' do
    #   subject.touch_out(station2)
    #   expect(subject.fare).to eq(6)
    # end

  end
end
