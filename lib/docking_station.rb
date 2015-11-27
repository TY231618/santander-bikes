require_relative 'bike'

class DockingStation

attr_accessor :docked, :bike

def initialize
  @docked = false
end

  def release_bike
    fail 'no bikes available' if @bike == nil
    @bike
  end

  def dock(bike)
    @docked = true
    @bike = bike
  end

  # def docked?
  #   docked
  # end
  #
  # def docked
  #   docked = tru
  # end

end
