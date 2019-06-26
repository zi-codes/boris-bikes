require_relative './Bike.rb'

class DockingStation
  def release_bike
    Bike.new
  end

  def dock(bike)
    @bike = bike
  end

  #attr_reader :bike
  # Equivalent to:
  # def bike
  # @bike
  # end
end
