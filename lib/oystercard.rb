class Oystercard
  MAX_BALANCE = 90
  MIN_BALANCE = 1
  attr_reader :balance, :entry_station, :exit_station, :previous_journey, :all_journeys

  def initialize
    @balance = 0
    # @in_journey = false
    # @previous_journey = {}
    # @all_journeys = []
  end

  def top_up(money)
    raise "Card Limit of #{MAX_BALANCE} Exceeded" if balance + money > MAX_BALANCE
    @balance += money
  end

  def deduct(money)
    @balance -= money
  end

  # def touch_in(station)
  #   raise "Error: balance below minimum" if balance < MIN_BALANCE
  #   @entry_station = station
  #   @previous_journey[:entry_station] = station
  # end
  #
  # def touch_out(station)
  #   deduct(MIN_BALANCE)
  #   @entry_station = nil
  #   @exit_station = station
  #   @previous_journey[:exit_station] = station
  #   @all_journeys << @previous_journey
  # end
  #
  # def in_journey?
  #   !!entry_station
  # end

  private :deduct

end
