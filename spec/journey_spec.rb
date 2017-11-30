require 'journey'

describe Journey do

  let(:station) {double(:station)}

  describe "#start" do
    it "should have an entry station" do
      expect(subject.start(station)).to eq station
      # expect(subject.entry_station).to eq station
    end

    it "should record allow to call the entry station" do
      subject.start(station)
      expect(subject.entry_station).to eq station
    end
  end

  describe "#end" do
    it "should have an exit station" do
      expect(subject.end(station)).to eq station
    end

    it "should record allow to call the entry station" do
      subject.end(station)
      expect(subject.exit_station).to eq station
    end
  end
end
