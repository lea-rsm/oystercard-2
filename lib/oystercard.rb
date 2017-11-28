class Oystercard
	attr_reader :balance
	DEFAULT_LIMIT = 90

	def initialize
		@balance = 0
		@balance_limit = 90
		@in_journey = false
	end

	def add_money(amount)
		raise 'The balance limit is 90 pounds' if over_limit?(amount)
		@balance += amount
	end

	def deduct(amount)
		@balance -= amount
	end


	def touch_in
		raise "Insufficient Funds!" if @balance < 2
		@in_journey = true
	end	

	def touch_out
		@in_journey = false
	end

	def in_journey?
		@in_journey
	end
	private

	def over_limit?(amount)
		(@balance + amount) > DEFAULT_LIMIT
	end
end
