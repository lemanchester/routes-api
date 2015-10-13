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

  describe "#update" do
    let!(:route) { create(:route, origin: "Home", destination: "Work", distance: 10) }

    context "given a successful request" do

      before do
        put :update, id: route.id, format: :json,
        route: { origin: "H", destination: "W", distance: 30 }
      end

      it_behaves_like 'successful response'

      it { expect(response).to match_response_schema("route") }

      it "returns the error message" do
        expect(response.body).to include("W")
      end
    end

    context "given a bad request request" do

      before { put :update, id: route.id, format: :json }

      it_behaves_like 'bad response'

    end
  end

  describe "#destroy" do
    let!(:route) { create(:route) }

    context "given a successful request" do

      before { delete :destroy, id: route.id, format: :json }

      it_behaves_like 'successful response'

    end

    context "given a not found request" do

      before { delete :destroy, id: 99, format: :json }

      it_behaves_like 'not found response'

    end
  end

end
