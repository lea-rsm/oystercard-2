require "oystercard"

describe Oystercard do

	it 'has no money at the beginning' do
		expect(subject.balance).to eq 0
	end

	it 'can be loaded with money' do
		oyster = Oystercard.new
		oyster.add_money(5)
		expect(oyster.balance).to eq 5
	end
end