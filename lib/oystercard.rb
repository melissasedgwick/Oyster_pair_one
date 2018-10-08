class Oystercard
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(money)
    raise "Card Limit £90" if @balance + money > 90
    @balance += money


  end

end
