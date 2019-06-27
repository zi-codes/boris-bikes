require 'DockingStation'

describe DockingStation do
  let(:bike) { double :bike }
  it "when a bike is docked, we can see that a bike has been docked" do
  #  bike1 = double("bike")

    expect(subject.dock(bike)).to include bike
  end
  it "when there are no bikes docked, should raise an error to release bikes" do
    expect {subject.release_bike}.to raise_error("Error: no working bikes available")
  end
  it "when the bike station is full, should raise an error to say it's full" do
    20.times { subject.dock(bike)}

    expect {subject.dock(double("bike"))}.to raise_error("Error: capacity full")
  end
  it "when the user creates a new docking station they can set the capacity to 8" do
    dock = DockingStation.new(8)
    expect(dock.capacity).to eq 8
  end
  it "when the user creates a new docking station without specifying capacity it defaults to 20" do

    expect(subject.capacity).to eq 20
  end
  it "when the user returns a broken bike they can report it as broken" do
    allow(bike).to receive(:working?).and_return(false)
    allow(bike).to receive(:report_broken)
    subject.dock(bike,false)
    expect(bike.working?).to eq false
  end

end
