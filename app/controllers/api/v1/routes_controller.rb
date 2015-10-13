class Api::V1::RoutesController < Api::V1::ApiController

  before_action :load_map, only: [:index]
  before_action :load_route, only: [:show]

  def index
    render json: @map.routes
  end

  def show
    render json: @route
  end

  private

  def load_map
    @map = Map.includes(:routes).find params[:map_id]
  end

  def load_route
    @route = Route.find params[:id]
  end

end
