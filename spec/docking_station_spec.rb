require 'DockingStation'
describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }
end

describe "releasing a new bike" do
  it "should release a new bike1" do
    dock1 = DockingStation.new
    bike1 = dock1.release_bike
    expect(bike1.working?).to eq true
  end
end
