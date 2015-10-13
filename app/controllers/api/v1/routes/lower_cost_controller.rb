class Api::V1::Routes::LowerCostController < Api::V1::ApiController

  before_action :load_map, only: [:index]

  def index
    MapRoutesPresenceValidator.new(@map).validate!
    MapRoutePointsValidator.new(@map).validate!(params[:origin], params[:destination])
    render json: @map
  end

  private

  def load_map
    @map = Map.includes(:routes).find params[:map_id]
  end

  def route_params
    params.require(:route).permit(:origin, :destination, :autonomy, :liter_value)
  end

end
