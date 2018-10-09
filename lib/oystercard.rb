class Oystercard
  MAX_BALANCE = 90
  MIN_BALANCE = 1
  attr_reader :balance

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

  def touch_in
    raise "Error: balance below minimum" if balance < MIN_BALANCE
    @in_journey = true
  end

  def touch_out
    @in_journey = false
    deduct(MIN_BALANCE)
  end

  def in_journey?
    return @in_journey
  end

  private :deduct

end
