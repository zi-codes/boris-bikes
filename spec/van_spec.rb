require 'van'

describe Van do
  let(:dock) {double :dock}
  let(:garage) {double :garage}
  let(:bike) {double :bike}
  it "gets broken bikes from the docking station" do
    allow(dock).to receive(:dock)
    allow(dock).to receive(:list_broken_bikes).and_return([bike,bike])
    2.times { dock.dock(bike,false) }
    expect(subject.get_broken_bikes_from_docking_station(dock).length).to eq 2
  end
  it "delivers broken bikes to the garage" do
    allow(garage).to receive(:accept_broken_bikes).and_return([bike,bike])
    
    bike1 = instance_double("bike",:working => false)
    broken_bikes = []
    2.times {broken_bikes << bike1}
    van = Van.new(broken_bikes)
    expect(van.deliver_to_garage(garage).length).to eq 2
  end
  it "gets fixed bikes back from the garage" do

    fixed_bikes = []
    3.times {fixed_bikes << Bike.new()}
    garage = Garage.new([],fixed_bikes)

    expect(subject.get_fixed_bikes_from_garage(garage).length).to eq 3
  end
  it "distributes bikes back to docks" do

    fixed_bikes = []
    7.times {fixed_bikes << Bike.new()}
    van = Van.new([],fixed_bikes)
    dock = DockingStation.new

    expect(van.distribute_bikes_to_docks(dock).length).to eq 7

   
  end
  it_behaves_like  "return bikes"

end
