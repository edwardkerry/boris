require_relative 'bike'

class DockingStation

DEFAULT_CAPACITY = 20

	attr_reader :bike_dock
	attr_accessor :capacity

	def initialize(capacity=DEFAULT_CAPACITY)
		@capacity = capacity
		@bike_dock = []
  end

	def release_bike
		fail "There are no bikes docked here." if empty?
    fail "There are no working bikes docked here." if bike_dock.all?{|bike| bike.broken?}
    bike_dock.delete(bike_dock.find {|bike|!bike.broken?})
	end

	def dock_bike(bike)
		fail "This station is full." if full?
		bike_dock << bike
	end

	private

	def full?
  	bike_dock.count >= capacity
	end

	def empty?
  	bike_dock.empty?
	end

end
