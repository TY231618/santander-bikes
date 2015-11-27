require 'docking_station'

describe DockingStation do
#  it 'responds to release_bike' do
#    expect(subject).to respond_to :release_bike
#  end
  it { is_expected.to respond_to :release_bike }

  it 'releases working bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to eq bike
  end

  it 'docks a bike' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end

  it 'checks if a bike is docked' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.docked).to eq true
  end

  it 'does not release bikes when none available' do

    expect {subject.release_bike}.to raise_error 'no bikes available'
  end

end
