require 'rails_helper'

RSpec.describe Api::V1::RoutesController, type: :controller do

  describe "#index" do
    let!(:route) { create(:route) }

    before { get :index, map_id: route.map.id, format: :json }

    it_behaves_like 'successful response'

    it { expect(response).to match_response_schema("routes") }

  end

  describe "#show" do
    let!(:route) { create(:route) }

    context "given a successful request" do

      before { get :show, id: route.id, format: :json }

      it_behaves_like 'successful response'

      it { expect(response).to match_response_schema("route") }

    end

    context "given a not found request" do

      before { get :show, id: 99, format: :json }

      it_behaves_like 'not found response'

    end

  end

end
