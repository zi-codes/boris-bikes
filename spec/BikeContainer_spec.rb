require 'BikeContainer'

shared_examples_for "return bikes" do
  let(:collection) { described_class.new }
  it "#return_bikes" do
    expect(collection.return_bikes([1,1,1]).length).to eq(3)
  end

 
end
