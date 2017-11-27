require "oystercard"

describe Oystercard do

	it 'has no money at the beginning' do
		expect(subject.balance).to eq 0
	end

	it 'can be loaded with money' do
		expect{ subject.add_money 5 }.to change{ subject.balance }.by 5
	end
end
