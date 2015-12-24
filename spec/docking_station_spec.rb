require 'docking_station'

describe DockingStation do
  subject(:docking_station) {described_class.new}
  let(:bike) {double :bike}

  it { is_expected.to respond_to :release_bike }

  it 'releases working bikes' do
    allow(bike).to receive(:working?).and_return(true)
    docking_station.dock(bike)
    expect(docking_station.release_bike).to eq bike
  end

  it 'docks a bike' do
    expect(docking_station.dock(bike)).to eq [bike]
  end

  it 'does not release bikes when none available' do
    expect {docking_station.release_bike}.to raise_error 'no bikes available'
  end

  it 'does not release a broken bike' do
    allow(bike).to receive(:working?).and_return(false)
    docking_station.dock(bike)
    expect {docking_station.release_bike}.to raise_error 'no working bikes available'
  end

  it 'raises an error when full' do
    DockingStation::DEFAULT_CAPACITY.times { docking_station.dock(bike) }
    expect {docking_station.dock(bike)}.to raise_error 'Docking Station full'
  end

  it 'has a default capacity' do
    expect(docking_station.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  describe 'initialization' do
    it 'has a variable capacity' do
      docking_station = DockingStation.new(50)
      50.times { docking_station.dock(bike)}
      expect {docking_station.dock(bike)}.to raise_error 'Docking Station full'
    end
  end
end
