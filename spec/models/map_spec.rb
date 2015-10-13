require 'rails_helper'

RSpec.describe Map, type: :model do

  describe  "Validations" do

    it { expect(subject).to validate_presence_of(:name) }

    it { expect(subject).to validate_uniqueness_of(:name) }
  end


  describe "#route_points" do
    let!(:map)   { create(:map) }

    before do
      create(:route, origin: "A", destination: "B", map: map)
      create(:route, origin: "C", destination: "D", map: map)
    end

    subject { map.route_points }

    it { expect(subject).to be_instance_of Array }

    it "return array with all origin and destinations" do
      expect(subject).to be_eql ["A", "C", "B", "D"]
    end

  end


end
