require 'oystercard.rb'

describe Oystercard do

	it 'has no money at the beginning' do
		expect(subject.balance).to eq 0
	end

	it 'can be loaded with money' do
		expect{ subject.add_money 5 }.to change{ subject.balance }.by 5
	end

	it 'has a balance limit of 90 Pounds' do
		expect{ subject.add_money 91 }.to raise_error 'The balance limit is 90 pounds'
	end
end
