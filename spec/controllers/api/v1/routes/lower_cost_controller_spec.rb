require 'rails_helper'

RSpec.describe Api::V1::Routes::LowerCostController, type: :controller do

  describe "#index" do
    let!(:route) { create(:route) }

    before { get :index, map_id: route.map.id, format: :json }

    it_behaves_like 'successful response'

  end

end
