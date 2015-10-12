class Api::V1::RoutesController < Api::V1::ApiController

  before_action :load_map, only: [:index]

  def index
    render json: @map.routes
  end

  private

  def load_map
    @map = Map.includes(:routes).find params[:map_id]
  end


end
