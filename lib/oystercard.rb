class Oystercard
	attr_reader :balance
	
	def initialize(balance = 0)
		@balance = balance
	end

	def add_money(quantity)
		@balance += quantity
	end
end