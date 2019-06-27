require_relative './DockingStation.rb'
require_relative './garage.rb'
require_relative './BikeContainer.rb'

class Van
  include BikeContainer
  def initialize(broken_bikes = [],working_bikes = [])
    @broken_bikes = broken_bikes
    @working_bikes = working_bikes
  end

  def get_broken_bikes_from_docking_station(dockingstation)
    list = dockingstation.list_broken_bikes
    @broken_bikes << list
    return list
  end

  def deliver_to_garage(garage)
    garage.accept_broken_bikes(@broken_bikes)
  end

  def get_fixed_bikes_from_garage(garage)
    @working_bikes.push(*garage.return_fixed_bikes)
    return @working_bikes
  end

  def distribute_bikes_to_docks(dock)
    dock.receive_bikes(@working_bikes)
  end

end
