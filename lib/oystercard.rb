class Oystercard
	attr_reader :balance
	DEFAULT_LIMIT = 90

	def initialize(balance = 0)
		@balance = balance
		@balance_limit = 90
	end

	def add_money(quantity)
		raise 'The balance limit is 90 pounds' if balance_full?(quantity)
		@balance += quantity
	end

	private
	def balance_full?(quantity)
		(@balance + quantity) > DEFAULT_LIMIT
	end
end
