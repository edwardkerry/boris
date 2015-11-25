require_relative 'bike'

class DockingStation
	attr_reader :bike

	def release_bike
		fail "no bikes" unless @bike
		@bike
	end

	def dock_bike(bike)
		@bike = bike
	end

end
