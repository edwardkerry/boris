require 'van.rb'

describe Van do

  describe '#initialize' do
    it 'should have an array called bikes_on_van' do
     expect(subject.instance_variable_get(:@bikes_on_van))
    end
  end

  describe '#collect_broken_bike' do
    it 'should respond to collect_broken_bike method call' do
      expect(subject).to respond_to :collect_bike
    end

    it 'should take the current docking station as an argument' do
      expect(subject).to respond_to(:collect_bike).with(1).argument
    end

    it 'should collect bikes from the current docking station\s bike dock(array)' do
      station = DockingStation.new
      10.times{station.dock_bike(Bike.new)}
      expect(subject.collect_bike(station)).to eq station.bike_dock
    end

    it 'should collect broken bikes from the current docking station\s bike dock(array)' do
      station = DockingStation.new #this has an array called bike_dock
      10.times{station.dock_bike(Bike.new)}
      broken = Bike.new
      broken.report_broken
      station.dock_bike(broken)
      expect(subject.collect_broken_bike(station)).to eq [broken]
    end

    it 'should take away the broken bikes from the bike_dock' do

      station = DockingStation.new #this has an array called bike_dock
      10.times{station.dock_bike(Bike.new)}
      broken = Bike.new
      broken.report_broken
      station.dock_bike(broken)
      subject.collect_broken_bike(station)
      expect(station.bike_dock).not_to include broken
    end

  end


end
