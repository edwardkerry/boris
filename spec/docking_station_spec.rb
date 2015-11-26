# spec/docking_station_spec.rb

require 'docking_station'

describe DockingStation do

	it 'should report to method bike' do
		expect(subject).to respond_to :bike_dock
	end

  describe 'initialize' do
		it 'has a default capacity' do
			expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
		end

		it 'has a variable capacity' do
		  station = DockingStation.new(50)
			50.times { station.dock_bike(double(:bike)) }
			expect { station.dock_bike(double(:bike)) }.to raise_error("This station is full.")
     end
	end

	describe '#dock_bike' do
		it 'should respond to method dock_bike' do
			expect(subject).to respond_to(:dock_bike).with(1).argument
		end

		it 'should allow a bike to dock' do
			bike = (double(:bike))
			expect(subject.dock_bike(bike)).to eq [bike]
		end

		it 'should raise an error if the station is full' do
			DockingStation::DEFAULT_CAPACITY.times { subject.dock_bike(double(:bike)) }
			expect { subject.dock_bike(double(:bike)) }.to raise_error("This station is full.")
		end
	end

	describe '#release_bike' do
		it 'should respond to release_bike method call' do
			expect(subject).to respond_to :release_bike
		end

		it 'releases a bike' do
			bike = (double(:bike, broken?: false))
			subject.dock_bike(bike)
			expect(subject.release_bike).to eq bike
		end

		it 'removes the released bike from the bike dock' do
			10.times {subject.dock_bike (double(:bike, broken?: false))}
			bike = subject.release_bike
			expect(subject.bike_dock.include?(bike)).to be false
		end

		it 'shows an error if station is empty' do
			expect{subject.release_bike}.to raise_error("There are no bikes docked here.")
		end

		it 'should not release a broke bike' do
			bike = (double(:bike, broken?: true))
			subject.dock_bike(bike)
			expect {subject.release_bike}.to raise_error("There are no working bikes docked here.")
		end
	end
end
