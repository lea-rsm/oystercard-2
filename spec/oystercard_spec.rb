require 'oystercard.rb'

describe Oystercard do
	it { is_expected.to respond_to(:add_money).with(1).argument }

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
		subject.deduct(2)
		expect(subject.balance).to eq 3
	end
end
