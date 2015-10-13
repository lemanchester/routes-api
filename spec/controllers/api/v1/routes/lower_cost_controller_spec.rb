require 'rails_helper'

RSpec.describe Api::V1::Routes::LowerCostController, type: :controller do

  describe "#index" do
    let!(:route) { create(:route, origin: "A", destination: "B") }

    let(:route_params) do
      { origin: "A", destination: "B", autonomy: 10, liter_value: 5 }
    end

    context "given a successful request" do

      before do
        get :index, map_id: route.map.id, route: route_params, format: :json
      end

      it_behaves_like 'successful response'
    end

    context "given the map does not contain routes" do
      let!(:map) { create(:map) }
      let(:error_msg) { "This map does not contain any routes registered"}

      before { get :index, map_id: map.id, route: route_params, format: :json }

      it_behaves_like 'unprocessed'
    end

    context "given the map does not contain origin as a route" do
      let!(:route) { create(:route, origin: "A", destination: "B") }
      let(:route_params) do
        { origin: "X", destination: "B", autonomy: 10, liter_value: 5 }
      end

      let(:error_msg) { "This map does not contain X as a route"}

      before { get :index, map_id: route.map.id, route: route_params, format: :json }

      it_behaves_like 'unprocessed'
    end

    context "given the map does not contain destination as a route" do
      let!(:route) { create(:route, origin: "A", destination: "B") }
      let(:route_params) do
        { origin: "A", destination: "Y", autonomy: 10, liter_value: 5 }
      end

      let(:error_msg) { "This map does not contain Y as a route"}

      before { get :index, map_id: route.map.id, route: route_params, format: :json }

      it_behaves_like 'unprocessed'
    end

  end

end
