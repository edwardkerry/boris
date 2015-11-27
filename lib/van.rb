require_relative 'bike'
require_relative 'docking_station'
class Van

def initialize
  @bikes_on_van = []
end

def collect_bike(current_station)
   current_station.bike_dock.each {|bike| @bikes_on_van << bike}
end

def collect_broken_bike(current_station)
  result = current_station.bike_dock.find_all {|bike| @bikes_on_van << bike if bike.broken?}
  bikes_to_remove = current_station.bike_dock - @bikes_on_van
  current_station.clear_collected_bikes(bikes_to_remove)
  result
end

end
