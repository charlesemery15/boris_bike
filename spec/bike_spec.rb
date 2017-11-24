require "Bike"

describe Bike do
  # it "is bike working?" do
  #   is_expected.to respond_to :working?
  # end
  # why does this fail....
  it{ is_expected.to respond_to :working?} # this works...

  it "can report bike as broken" do
    subject.report_broken  # RSpec's predicate matchers have a look???
    expect(subject).to be_broken
  end

end
