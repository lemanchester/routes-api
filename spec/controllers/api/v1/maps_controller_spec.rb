require 'rails_helper'

RSpec.describe Api::V1::MapsController, type: :controller do

  describe "GET #index" do
    let!(:map) { create(:map, name: "treasure map") }


    before { get :index, format: :json }

    it_behaves_like 'successful response'

    it { expect(response).to match_response_schema("maps") }

  end

  describe "GET #show" do
    let!(:map) { create(:map, name: "treasure map") }

    context "given a successful request" do

      before { get :show, id: map.id, format: :json }

      it_behaves_like 'successful response'

      it { expect(response).to match_response_schema("map") }

    end

    context "given a not found request" do

      before { get :show, id: 99, format: :json }

      it_behaves_like 'not found response'

    end

  end

  describe "PUT #update" do
    let!(:map) { create(:map, name: "treasure map") }

    context "given a successful request" do

      before { put :update, id: map.id, format: :json, map: {name: "new map"} }

      it_behaves_like 'successful response'

      it { expect(response).to match_response_schema("map") }

      it "returns the error message" do
        expect(response.body).to include("new map")
      end
    end

    context "given a bad request request" do

      before { put :update, id: map.id, format: :json }

      it_behaves_like 'bad response'

    end

  end

end
