require 'rails_helper'

RSpec.describe Api::V1::MapsController, type: :controller do

  describe "GET #index" do
    let!(:map) { create(:map, name: "treasure map") }


    before { get :index, format: :json }

    it 'responds with 200' do
      expect(response.code).to eq '200'
    end

    it "returns the right content type" do
      expect(response.header['Content-Type']).to eq("application/json; charset=utf-8")
    end

    it { expect(response).to match_response_schema("maps") }

  end

  describe "GET #show" do
    let!(:map) { create(:map, name: "treasure map") }

    context "given a successful request" do

      before { get :show, id: map.id, format: :json }

      it 'responds with 200' do
        expect(response.code).to eq '200'
      end

      it "returns the right content type" do
        expect(response.header['Content-Type']).to eq("application/json; charset=utf-8")
      end

      it { expect(response).to match_response_schema("map") }

    end

    context "given a not found request" do

      before { get :show, id: 99, format: :json }

      it 'responds with 404' do
        expect(response.code).to eq '404'
      end

      it "returns the right content type" do
        expect(response.header['Content-Type']).to eq("application/json; charset=utf-8")
      end

      it "returns the error message" do
        expect(response.body).to include("Couldn't find")
      end

    end

  end

end
