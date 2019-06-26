require_relative './Bike.rb'

class DockingStation

  def release_bike
    raise "Error: no bikes available" unless self.bike
    Bike.new
  end

  def dock(bike)
    raise "Error: capacity full" unless !self.bike
    @bike = bike
  end

  attr_reader :bike
  # Equivalent to:
  # def bike
  # @bike
  # end
end
