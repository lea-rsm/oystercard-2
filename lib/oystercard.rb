class Oystercard
	attr_reader :balance, :entry_station
	BALANCE_LIMIT = 90
	MINIMUM_BALANCE = 0	
	MINIMUM_FARE = 2

	def initialize
		@balance = 0
		@balance_limit = 90
		@in_journey = false
		@entry_station = ''
	end

	def add_money(amount)
		raise 'The balance limit is 90 pounds' if over_limit?(amount)
		@balance += amount
	end

	def touch_in(station)
		raise "Insufficient Funds!" if @balance < 2
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
end
