require_relative 'bike'

class DockingStation

DEFAULT_CAPACITY = 20

attr_accessor :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    fail 'no bikes available' if empty?
    bike = bikes.pop
    fail 'no working bikes available' if !bike.working?
    bike
  end

  def dock(bike)
    fail 'Docking Station full' if full?
    bikes << bike
  end

  private

  attr_reader :bikes

  def empty?
    bikes.empty?
  end

  def full?
    bikes.count >= capacity
  end

end
