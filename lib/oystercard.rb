class Oystercard
	attr_reader :balance, :entry_station
	BALANCE_LIMIT = 90
	MINIMUM_BALANCE = 0	
	MINIMUM_FARE = 2

	def initialize
		@balance = 0
		@in_journey = false
		@entry_station = nil
	end

	def add_money(amount)
		raise "The balance limit is #{BALANCE_LIMIT} pounds" if over_limit?(amount)
		@balance += amount
	end

	def touch_in(station)
		raise "Insufficient Funds!" if insufficient_funds?
		@entry_station = station
		@in_journey = true
	end	

	def touch_out
		deduct(MINIMUM_FARE)
		@in_journey = false
	end

	def in_journey?
		@in_journey
	end
	
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
