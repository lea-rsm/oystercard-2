require 'oystercard.rb'

describe Oystercard do
	it { is_expected.to respond_to(:add_money).with(1).argument }
	it { is_expected.to respond_to(:deduct).with(1).argument }
	it { is_expected.to respond_to(:touch_in) }

	describe 'balance' do
		it 'has no money at the beginning' do
			expect(subject.balance).to eq 0
		end

		it 'can be loaded with money' do
			expect{ subject.add_money(5) }.to change{ subject.balance }.by 5
		end

		it 'has a balance limit of 90 Pounds' do
			expect{ subject.add_money 91 }.to raise_error 'The balance limit is 90 pounds'
		end

		it 'can have balance deducted' do
			subject.add_money(5)
			expect{ subject.deduct(2) }.to change{ subject.balance }.by -2
		end
	end

	describe 'touch in and out' do
		it 'is not initially in a journey' do
			expect(subject.balance).to eq 0
		end

		it 'can touch in when entering the tube' do
			subject.touch_in
			expect(subject.in_journey?).to be true
		end

		it 'can touch out when leaving the tube' do
			subject.touch_in
			subject.touch_out
			expect(subject.in_journey?).to be false
		end

	end

end
