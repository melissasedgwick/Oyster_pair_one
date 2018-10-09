class Oystercard
  MAX_BALANCE = 90
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(money)
    raise "Card Limit of #{MAX_BALANCE} Exceeded" if balance + money > MAX_BALANCE
    @balance += money
  end

  def deduct(money)
    @balance -= money
  end

end
