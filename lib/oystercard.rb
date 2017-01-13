require 'journey_log'
require 'journey'

class Oystercard
attr_reader :balance, :current_journey_log
attr_accessor :station_history, :entry_station, :exit_station, :current_journey
MAX_LIMIT = 90
MIN_LIMIT = 1

  def initialize
    @balance = 0
    @current_journey_log = Journey_log.new
    @current_journey = Journey.new(nil)
  end

  def top_up(money)
    raise "Limit of #{MAX_LIMIT} exceeded, can not top up the card." if @balance + money > MAX_LIMIT
    @balance += money
  end

  def touch_in(entry_station)
    raise "Insufficient funds. Must top up card." if balance < MIN_LIMIT
    @current_journey= Journey.new(entry_station)
  end

  def touch_out(exit_station)
    deduct(MIN_LIMIT)
    current_journey.end(exit_station)
    journey_log
    @current_journey = nil
  end

def journey_log
  current_journey_log.add(current_journey)
end

private
    def deduct(money)
      @balance -= money
    end
end
