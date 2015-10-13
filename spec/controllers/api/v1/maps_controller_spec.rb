require 'rails_helper'

RSpec.describe Api::V1::MapsController, type: :controller do

  describe "#index" do
    let!(:map) { create(:map, name: "treasure map") }


    before { get :index, format: :json }

    it_behaves_like 'successful response'

    it { expect(response).to match_response_schema("maps") }

  end

  describe "#show" do
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

  describe "#update" do
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
      let(:error_msg) { "param is missing" }

      before { put :update, id: map.id, format: :json }

      it_behaves_like 'bad response'

    end

  end

  describe "#destroy" do
    let!(:map) { create(:map, name: "treasure map") }

    context "given a successful request" do

      before { delete :destroy, id: map.id, format: :json }

      it_behaves_like 'successful response'

    end

    context "given a not found request" do

      before { delete :destroy, id: 99, format: :json }

      it_behaves_like 'not found response'

    end

  end

  describe "#create" do
    let(:map) { attributes_for(:map, name: "treasure map") }

    context "given a successful request" do

      before { post :create, map: map, format: :json  }

      it_behaves_like 'successful response'

    end

    context "given a bad request request" do
      let(:error_msg) { "param is missing" }

      before { post :create, format: :json }

      it_behaves_like 'bad response'

    end

  end

end
