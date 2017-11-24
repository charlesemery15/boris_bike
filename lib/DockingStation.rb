require_relative "Bike"

class DockingStation

  DEFAULT_CAPACITY = 20
  attr_accessor :capacity

  # DEFAULT_CAPACITY = 20 -- constants first as not going to change
  # attr_accessor :capacity -- the same as : def capacity
                                            # @capacity
                                          # end

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  # def initialize(capacity = DEFAULT_CAPACITY)
  #   @bikes = [] -- can also @bikes = Array.new
  #   @capacity = capacity -- can have @capacity = DEFAULT_CAPACITY (WITHOUT THE LINE ^)
  # end

  def release_bike
    raise(RuntimeError, "No bikes available") unless !empty?
    raise("Cannot release a broken bike") if @bikes.last.broken?
    @bikes.pop
  end

  # def release_bike -- (b_bike) want a specific bike option ONLY
  #   raise(RuntimeError, "No bikes available") unless !empty? -- best practice as attr_reader adds '@'
  #   raise("Bike broken") if (@bikes.last.working? == false )
  #   @bikes.pop -- .delete(b_bike)
  # end

  def dock(a_bike)
    raise RuntimeError, "Dock full" unless !full?  #guard condition
     #record
    # adding bikes to the "DockingStation"
    @bikes.push(a_bike) # << same as .push
  end

  private

  def full?
    @bikes.length == @capacity
  end

  def empty?
    @bikes.empty?
  end
end
