class Journey
  attr_accessor :entry_station, :exit_station

 def initialize
   @entry_station = nil
   @exit_station = nil

 end
  MIN_FARE = 1
  PENALTY_FARE = 5

  def fare
    if exit_station == nil || entry_station == nil
      MIN_FARE+PENALTY_FARE
    else
      MIN_FARE + (entry_station.zone-exit_station.zone).abs
    end
  end

  def start(station)
    @entry_station = station
  end

  def end(station)
    @exit_station = station
  end

end
