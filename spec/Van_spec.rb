require "Van"

describe Van do
  it "can store a bike" do
    a_bike = double(:bike)
    expect(subject.load_bikes(a_bike)).to include a_bike
  end
end
