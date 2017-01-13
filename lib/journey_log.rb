require_relative './journey'

class Journey_log
  attr_reader :journey_history, :journey_class
  attr_accessor :current_journey

  def initialize
    @journey_history = []
    @journey_class = Journey
    @current_journey = nil
  end

  def add(journey)
    @journey_history << {entry_station: journey.entry_station, exit_station: journey.exit_station}
  end

  def start(card, station)
    new_journey = journey_class.new
    new_journey.start(station)
    @current_journey= new_journey
  end

  def finish(card, station)
    current_journey.end(station)
    add(current_journey)
  end

  def reset_current_journey
    @current_journey=nil
  end

  def journeys(card)
    journey_history
  end

  private
  def current_journey_check
    (current_journey == nil) ? journey_class.new : current_journey
  end
end
