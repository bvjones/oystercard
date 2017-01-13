require 'journey_log'
require 'oystercard'

describe Journey_log do
  describe '#journey_history' do
    it 'should respond to journey_history' do
      expect(subject).to respond_to(:journey_history)
    end
  end

  describe '#add' do
    it 'should respond to add' do
      expect(subject).to respond_to(:add)
    end
    it 'adds a journey to journey history' do
      journey = Journey.new(nil)
      subject.add(journey)
      expect(subject.journey_history).to include({entry_station: journey.entry_station, exit_station: journey.exit_station})
    end
  end

  describe "#start" do
    let(:entry_station){double :station}

    it 'should respond to start' do
      expect(subject).to respond_to(:start).with(2).argument
    end
    it 'should start a new journey' do
      oystercard = Oystercard.new
      subject.start(oystercard, entry_station)
      # oystercard.journey_log
      expect(subject.current_journey.entry_station).to eq(entry_station)
    end
  end
  describe "#finish" do
    let(:entry_station){double :station}
    let(:exit_station){double :station}

    it 'should respond to finish' do
      expect(subject).to respond_to(:finish).with(2).argument
    end
    it 'should add an exit station' do
      oystercard = Oystercard.new
      subject.start(oystercard, entry_station)
      subject.finish(oystercard, exit_station)
      # oystercard.journey_log
      expect(subject.journey_history[0][:exit_station]).to eq(exit_station)
    end
  end
  describe '#journeys' do
    let(:entry_station){double :station}
    let(:exit_station){double :station}

    it 'should respond to journeys' do
      expect(subject).to respond_to(:journeys).with(1).argument
    end
    it 'should return the array of journeys' do

    end
  end
end
