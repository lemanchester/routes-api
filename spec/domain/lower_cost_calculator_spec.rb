require 'rails_helper'

RSpec.describe LowerCostCalculator do

  describe "#shortest_path" do
    let(:map) { create(:map) }

    context "given A B C routes show the shortest to get from A to C" do
      before do
        map.routes << build(:route, origin: "A", destination: "B",  distance: 10)
        map.routes << build(:route, origin: "B", destination: "C",  distance: 30)
        map.routes << build(:route, origin: "A", destination: "C",  distance: 20)
      end

      let(:options) do
        { origin: "A", destination: "C", autonomy: 10, liter_value: 3 }
      end

      subject { described_class.new(map).calculate(options) }

      it { expect(subject).to be_instance_of LowerCost }

      it "returns an array with the shortes route" do
        expect(subject.route).to be_eql "A,C"
      end

      it "returns the cost" do
        expect(subject.cost).to be_equal 6.0
      end

    end

  end

end
