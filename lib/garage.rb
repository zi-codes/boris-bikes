class Garage
  def initialize(broken_bikes = [],fixed_bikes = [])
    @broken_bike_array = broken_bikes
    @fixed_bikes = fixed_bikes
  end

  def accept_broken_bikes(bikes)
    @broken_bike_array << bikes
    return bikes
  end

  def fix_bike(bikes)
    bikes.each {|bike| bike.fix
      @fixed_bikes << bike
    }

  end

  def return_fixed_bikes
    @fixed_bikes
  end

end
