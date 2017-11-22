require_relative "Bike"

class DockingStation
  attr_reader :bike #don't need to initiliaze the bike instance variable

  def release_bike
    raise RuntimeError, "No bikes available" unless @bike
    @bike
  end

  def dock(a_bike)
    raise RuntimeError, "Dock full" unless !@bike #guard condition
    @bike = a_bike
  end

end
