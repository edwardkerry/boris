require_relative 'bike'

class DockingStation
	attr_reader :bike

	def release_bike
		fail "no bikes" unless @bike
		@bike
	end

	def dock_bike(bike)
		fail "This station is full" if @bike 
		@bike= bike
	end

end
