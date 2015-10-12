require 'rails_helper'

RSpec.describe RouteSerializer, :type => :serializer do

  context 'given a single resource' do
    let(:resource_hash) do
      { id: 1, origin: "Earth", destination: "Mart", distance: 900000 }
    end

    let(:resource) { Route.new(resource_hash) }

    subject { described_class.new(resource).as_json }

    it 'returns the expected params' do
      expect(subject).to match(
        a_hash_including("route" => resource_hash)
      )
    end

  end
end
