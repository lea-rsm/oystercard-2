require './lib/oystercard'

# new oyster card
p oyster = Oystercard.new
# should display a balance of 0
p oyster.balance
# add some money
p oyster.add_money(5)
# balance should now return 5
p oyster.balance