class Oystercard
  MAX_BALANCE = 90
  MIN_BALANCE = 1
  attr_reader :balance, :entry_station

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(money)
    raise "Card Limit of #{MAX_BALANCE} Exceeded" if balance + money > MAX_BALANCE
    @balance += money
  end

  def deduct(money)
    @balance -= money
  end

  def touch_in(station)
    raise "Error: balance below minimum" if balance < MIN_BALANCE
    @entry_station = station
  end

  def touch_out
    deduct(MIN_BALANCE)
    @entry_station = nil
  end

  def in_journey?
    !!entry_station
  end

  private :deduct

end
