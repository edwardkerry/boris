# spec/docking_station_spec.rb

require 'docking_station'

describe DockingStation do
	it "should respond to release_bike method call" do
		expect(subject).to respond_to :release_bike
	end

	describe '#release_bike' do
		it 'releases a bike' do
			bike = Bike.new
			subject.dock_bike(bike)
			expect(subject.release_bike).to eq bike
		end
		it 'shows an error if station is empty' do
			expect { subject.release_bike}.to raise_error("no bikes")
		end
	end

	it "should respond to method dock_bike" do
		expect(subject).to respond_to(:dock_bike).with(1).argument
	end

	it "should allow a bike to dock" do
		bike = Bike.new
		expect(subject.dock_bike(bike)).to eq bike
	end

	it "should respond to method bike" do
		expect(subject).to respond_to :bike
	end

	it "should return the docked bike" do
		bike = Bike.new
		subject.dock_bike(bike)
		expect(subject.bike).to eq bike
	end



end
