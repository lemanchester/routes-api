require 'rails_helper'

RSpec.describe Api::V1::Routes::LowerCostController, type: :controller do

  describe "#index" do
    let!(:route) { create(:route) }

    before { get :index, map_id: route.map.id, format: :json }

    it_behaves_like 'successful response'

    context "given the map doesnt contain routes" do
      let!(:map) { create(:map) }
      let(:error_msg) { "This map does not contain any routes registered"}

      before { get :index, map_id: map.id, format: :json }

      it_behaves_like 'unprocessed'
    end

  end

end
