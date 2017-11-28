class Oystercard
	attr_reader :balance
	DEFAULT_LIMIT = 90

	def initialize(balance = 0)
		@balance = balance
		@balance_limit = 90
	end

	def add_money(amount)
		raise 'The balance limit is 90 pounds' if over_limit?(amount)
		@balance += amount
	end

	def deduct(amount)
		@balance -= amount
	end

	private

	def over_limit?(amount)
		(@balance + amount) > DEFAULT_LIMIT
	end
end
