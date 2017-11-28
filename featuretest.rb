require './lib/oystercard'

# parts 4-5
# # new oyster card
p oyster = Oystercard.new
# # should display a balance of 0
# p oyster.balance
# # add some money
# p oyster.add_money(5)
# # balance should now return 5
# p oyster.balance

# part 6
# p 'expect an error message when adding 91'
# p 'pounds to the oyster card because the limit is 90'
# p oyster.add_money(91)

# part 7
# p oyster.add_money(50)

# p 'expected balance 50'
# p oyster.balance

# p 'expecting to subtract £2'
# p oyster.deduct(2)

# part 8
p oyster.touch_in
p 'expect true'
p oyster.in_journey
