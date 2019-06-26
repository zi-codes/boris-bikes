require 'DockingStation'

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }
  it { is_expected.to respond_to(:dock) }
  it "when a bike is released, we expect the bike to be working" do
    bike = subject.release_bike
    expect(bike.working?).to eq true
  end
  it "when a bike is docked, we can see that a bike has been docked" do
    bike1 = Bike.new
    expect(subject.dock(bike1)).to eq bike1
  end
end
