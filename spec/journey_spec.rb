require 'journey'

describe Journey do
  let (:journey) { Journey.new }
  it 'can save an entry station' do
    expect{journey.entry_station="Bank"}.not_to raise_error
  end
  it 'can save an exit station' do
    expect{journey.exit_station="Bank"}.not_to raise_error
  end

  describe '#fare' do
    it 'calculates fare with penalty if forgotten to touch in' do
      expect(journey.fare).to eq 6
    end
    it 'correctly calculates the fare between the same zones' do
      entry_station = Station.new("victoria", 2)
      exit_station = Station.new("bond", 2)
      journey = Journey.new
      journey.start(entry_station)
      journey.end(exit_station)
      expect(journey.fare).to eq 1
    end
    it 'correctly calculates the fare between different zones' do
      entry_station = Station.new("victoria", 2)
      exit_station = Station.new("bond", 1)
      journey = Journey.new
      journey.start(entry_station)
      journey.end(exit_station)
      expect(journey.fare).to eq 2
    end
  end
end
