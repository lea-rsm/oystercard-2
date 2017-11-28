require 'oystercard.rb'

describe Oystercard do
	it { is_expected.to respond_to(:add_money).with(1).argument }
	it { is_expected.to respond_to(:touch_in).with(1).argument }
	it { is_expected.to respond_to(:touch_out) }

	STATION = 'station x'
	ADD_MONEY = 60
	TEST_DEDUCT_MONEY = 2

	describe 'balance' do
		it 'has no money initially' do
			expect(subject.balance).to eq 0
		end

		it 'can be loaded with money' do
			expect{ subject.add_money(ADD_MONEY) }.to change{ subject.balance }.by ADD_MONEY
		end

		it "has a balance limit of #{Oystercard::BALANCE_LIMIT} Pounds" do
			subject.add_money(ADD_MONEY)
			expect{ subject.add_money(ADD_MONEY) }.to raise_error "The balance limit is #{Oystercard::BALANCE_LIMIT} pounds"
		end
	end

	describe 'touch in and out' do
		it 'is not initially in a journey' do
			expect(subject.balance).to eq 0
		end

		it 'can touch in when entering the tube' do
			subject.add_money(ADD_MONEY)
			subject.touch_in(STATION)
			expect(subject.in_journey?).to be true
		end

		it 'can touch out when leaving the tube' do
			subject.add_money(ADD_MONEY)
			subject.touch_in(STATION)
			subject.touch_out
			expect(subject.in_journey?).to be false
		end

		it 'cannot touch in with insufficient funds' do
			expect { subject.touch_in(STATION) }.to raise_error "Insufficient Funds!" 
		end

		it 'deduces a fare when tapping out' do
			subject.add_money(ADD_MONEY)
			expect { subject.touch_out }.to change{ subject.balance }.by(-Oystercard::MINIMUM_FARE)
		end
	end

	describe 'stores information about travel' do
		it 'remembers the station it was last tapped at' do
			subject.add_money(ADD_MONEY)
			subject.touch_in(STATION)
			expect(subject.entry_station).to eq STATION
		end
	end
end
