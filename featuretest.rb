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
p 'expect an error message when adding 91'
p 'pounds to the oyster card because the limit is 90'
p oyster.add_money(91)