require 'docking_station'

describe DockingStation do

  it { is_expected.to respond_to :release_bike }

  it 'releases working bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to eq bike
  end

  it 'docks a bike' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq [bike]
  end

  # it 'checks if a bike is docked' do
  #   bike = Bike.new
  #   subject.dock(bike)
  #   expect(subject.docked).to eq true
  # end

  it 'does not release bikes when none available' do
    expect {subject.release_bike}.to raise_error 'no bikes available'
  end

  it 'does not release a broken bike' do
    bike = Bike.new
    bike.report_broken
    subject.dock(bike)
    expect {subject.release_bike}.to raise_error 'no working bikes available'
  end

  it 'raises an error when full' do
    bike = Bike.new
    DockingStation::DEFAULT_CAPACITY.times { subject.dock(bike) }
    expect {subject.dock(bike)}.to raise_error 'Docking Station full'
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  describe 'initialization' do
    it 'has a variable capacity' do
      subject = DockingStation.new(50)
      bike = Bike.new
      50.times { subject.dock(bike)}
      expect {subject.dock(bike)}.to raise_error 'Docking Station full'
    end
  end
end
