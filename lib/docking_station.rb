require_relative 'bike'
require_relative 'van'

class DockingStation

  DEFAULT_CAPACITY = 20

	attr_accessor :capacity


  def clear_collected_bikes(bikes_to_clear)
    @bike_dock = bikes_to_clear
  end

	def initialize(capacity=DEFAULT_CAPACITY)
		@capacity = capacity
		@bike_dock = []
  end

	def dock_bike(bike)
		fail "This station is full." if full?
		bike_dock << bike
	end

	def release_bike
		fail "There are no bikes docked here." if empty?
    fail "There are no working bikes docked here." if all_broken?
    give_bike
	end

  #private - to allow RSPEC to pass bike_dock related tests

	attr_reader :bike_dock

	private

	def full?
  	bike_dock.count >= capacity
	end

	def empty?
  	bike_dock.empty?
	end

  def all_broken?
    bike_dock.all?{|bike| bike.broken?}
  end

  def give_bike
    bike_dock.delete(bike_dock.find {|bike|!bike.broken?})
  end

end
