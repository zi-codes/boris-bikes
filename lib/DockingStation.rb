require_relative './Bike.rb'

class DockingStation

  attr_reader :bike_array, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bike_array = []
    @capacity = capacity
  end

  def list_broken_bikes
    @bike_array.select{ |bike| !bike.working? }
  end

  def release_bike
    working_bikes_array = @bike_array.select{ |bike| bike.working? }

    raise "Error: no working bikes available" if working_bikes_array.empty?
    working_bikes_array.pop
  end

  def dock(bike,is_working = true)
    raise "Error: capacity full" if full?
    bike.report_broken unless is_working
    @bike_array << bike

  end

  def receive_bikes(bikes)
    @bike_array.push(*bikes)
    return bikes
  end

  private

  def full?
    @bike_array.length >= DEFAULT_CAPACITY
  end

  def empty?
    @bike_array.empty?
  end

end
