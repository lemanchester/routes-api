require 'rails_helper'

RSpec.describe LowerCostSerializer, :type => :serializer do

  context 'given a single resource' do
    let(:resource) { LowerCost.new("A,B,C", 35) }

    subject { described_class.new(resource).as_json }

    it 'returns the expected params' do
      expect(subject).to match(
        a_hash_including("lower_cost" => {route: "A,B,C", cost: 35})
      )
    end

  end
end
