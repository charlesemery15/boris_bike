require_relative "../lib/DockingStation.rb"
require_relative "../lib/Bike.rb"

station = DockingStation.new
a_bike = Bike.new
a_bike.report_broken
station.dock(a_bike)
