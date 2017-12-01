class Oystercard
  attr_reader :balance, :entry_station, :exit_station, :log, :current_journey
  BALANCE_LIMIT = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @log = []
  end

  def add_money(amount)
    raise "The balance limit is #{BALANCE_LIMIT} pounds" if over_limit?(amount)
    @balance += amount
  end

  def touch_in(entry_station, journey = Journey.new)
    deduct(@current_journey.fare) if in_journey?
    raise 'Insufficient Funds!' if insufficient_funds?
    @current_journey = journey
    @current_journey.start(entry_station)
  end

  def touch_out(exit_station)
    deduct(@current_journey.fare) if !in_journey?
    @current_journey.end(exit_station)
    @log << @current_journey
    deduct(@current_journey.fare)
    @current_journey = nil
  end

  def in_journey?
    !@current_journey.nil?
  end
  #test

  private

  def deduct(amount)
    @balance -= amount
  end

  def over_limit?(amount)
    (@balance + amount) > BALANCE_LIMIT
  end

  def insufficient_funds?
    @balance < MINIMUM_FARE
  end
end
