# spec/docking_station_spec.rb

require 'docking_station'

describe DockingStation do
	it "should respond to release_bike method call" do
		expect(subject).to respond_to :release_bike
	end

	it "should get a bike and expect the bike to be working" do
		bike = subject.release_bike
		expect(bike).to be_working
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
