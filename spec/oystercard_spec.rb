require 'oystercard'


describe Oystercard do

describe '#balance' do
  it 'checks that the oystercard has a balance' do
    expect(subject).to respond_to(:balance)
  end

end

describe 'initial balance' do
it 'has an initial balance' do
  expect(subject.balance).to eql 0
end
end

describe '#top_up' do
  it 'allows card to be topped up by a certain amount' do
    expect(subject).to respond_to(:top_up).with(1).argument
  end
end

  describe 'top up card with a value' do
    it 'the oystercard will accept a value and store it' do
    expect{subject.top_up Oystercard::MIN_LIMIT}.to change {subject.balance }.by (Oystercard::MIN_LIMIT)
  end
end

  describe '#MAX_LIMIT' do
  it 'will raise an error if top up limit is exceeded' do
    subject.top_up(Oystercard::MAX_LIMIT)
    expect{subject.top_up(Oystercard::MIN_LIMIT)}.to raise_error("Limit of #{Oystercard::MAX_LIMIT} exceeded, can not top up the card.")
  end
end

describe '#deduct' do
  it 'allows card to have balance deducted' do
    expect(subject).to respond_to(:deduct).with(1).argument
  end
end

  describe 'deduct money' do
  it "will deduct the amount off the card" do
    expect{subject.deduct (Oystercard::MIN_LIMIT)}.to change {subject.balance}.by (-Oystercard::MIN_LIMIT)
  end
end

describe 'in_journey' do
  it 'is initially not in journey' do
    expect(subject).not_to be_in_journey
  end
end

  describe 'touch_in' do
  it 'can touch in' do
    subject.top_up(Oystercard::MIN_LIMIT)
    subject.touch_in
    expect(subject).to be_in_journey
  end

  it 'raises error if not enough balance' do
    expect{subject.touch_in}.to raise_error("Insufficient funds. Must top up card.")
  end
end

describe 'tocuh_out' do
  it 'can touch out' do
    subject.touch_out
    expect(subject).not_to be_in_journey
  end
end
end
