require "DockingStation"
require "Bike.rb"

describe DockingStation do

  it { is_expected.to respond_to :release_bike }
  #another way of writing the test v
    # it "releases a bike" do
    #   is_expected.to respond_to :release_bike #whenever refereing to a method inside rspec use symbol eg//: :release_bike not release_bike
    # end
  it "releases working bikes" do
    #bike = Bike.new
    subject.dock(double(:bike))
    bike = subject.release_bike # setting up test ^
    expect(bike).to be_working # test working? (method) is returned true | to_not be_working return false
  end

  it "dock has accepted an argument" do
    expect(subject).to respond_to(:dock).with(1).argument
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it "allows user to set capacity of docking station" do
    expect(subject.capacity = 50).to eq(50)
  end

  describe "#release_bike" do

    it "releases a bike" do
      a_bike = double(:bike)
      subject.dock(a_bike)
      expect(subject.release_bike).to eq a_bike  #has () as testing if eq
    end

    it "should raise error when no bike docked" do # {} as testing if behaviour occurs
      expect{ subject.release_bike }.to raise_error(RuntimeError, "No bikes available")
    end

    it "can't release a broken bike" do
      a_bike = double(:bike)
      a_bike.report_broken
      subject.dock(a_bike)
      expect{ subject.release_bike }.to raise_error("Cannot release a broken bike")
    end


  end

  describe "#dock" do

    it "dock a bike" do
      a_bike = double(:bike)
      expect(subject.dock(a_bike)).to include a_bike
    end

    it "should raise error when full of bikes" do
      subject.capacity.times { subject.dock(double(:bike)) }
      expect{ subject.dock(double(:bike)) }.to raise_error(RuntimeError, "Dock full")
    end

    it "accepts a broken bike" do
      a_bike = double(:bike)
      a_bike.report_broken
      expect(subject.dock(a_bike)).to include a_bike

    end
  end
end
