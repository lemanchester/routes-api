require 'rails_helper'

RSpec.describe MapSerializer, :type => :serializer do

  context 'given a single resource' do
    let(:resource) { Map.new(id: 23, name: "dar bla" ) }

    subject { described_class.new(resource).as_json }

    it 'returns the expected params' do
      expect(subject).to match(
        a_hash_including("map" => {:id => 23, :name => "dar bla"})
      )
    end

  end
end
