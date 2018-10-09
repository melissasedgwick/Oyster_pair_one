require 'oystercard'

class Journey

  attr_reader :entry_station, :exit_station, :previous_journey, :all_journeys


  def initialize
    @card = Oystercard.new
    @in_journey = false
    @previous_journey = {}
    @all_journeys = []
  end

  def touch_in(station, balance)
    raise "Error: balance below minimum" if balance < Oystercard::MIN_BALANCE
    @entry_station = station
    @exit_station = nil
    @previous_journey[:entry_station] = station
  end

  def touch_out(station)
    #deduct(Oystercard::MIN_BALANCE)
    @entry_station = nil
    @exit_station = station
    @previous_journey[:exit_station] = station
    @all_journeys << @previous_journey
    #return fare
  end

  def in_journey?
    !!entry_station
  end

  # def complete_journey?
  #   if in_journey? || (@entry_station == nil && @exit_station != nil)
  #     return false
  #   else
  #     return true
  #   end
  # end

  def fare
    # if complete_journey?
      return Oystercard::MIN_BALANCE
    # else
    #   return 6
    # end

  end

end
