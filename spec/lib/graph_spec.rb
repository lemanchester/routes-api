require 'rails_helper'

RSpec.describe Graph do

  describe "#shortest_path" do
    let(:map) { create(:map) }

    context "given A B C as shortes route to get from A to C" do
      before do
        map.routes << build(:route, origin: "A", destination: "B",  distance: 10)
        map.routes << build(:route, origin: "B", destination: "C",  distance: 30)
        map.routes << build(:route, origin: "A", destination: "C",  distance: 50)
      end

      subject { described_class.new(map.routes).shortest_path("A", "C") }

      it { expect(subject).to be_instance_of Array }

      it "returns an array with the shortes route" do
        expect(subject.first).to be_eql ["A", "B", "C"]
      end

      it "returns the cost" do
        expect(subject.last).to be_equal 40.0
      end

    end

  end

end
