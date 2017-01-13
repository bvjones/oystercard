class Journey
  attr_accessor :entry_station, :exit_station

 def initialize(station)
   @entry_station = station
   @exit_station = nil

 end
  MIN_FARE = 1
  PENALTY_FARE = 5

  def fare
    MIN_FARE + ( (@entry_station and @exit_station) ? 0 : PENALTY_FARE )
  end

  def end(station)
    @exit_station = station
  end

end
