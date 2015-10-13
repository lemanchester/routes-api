class Api::V1::RoutesController < Api::V1::ApiController

  before_action :load_map, only: [:index]
  before_action :load_route, only: [:show, :update, :destroy]

  def index
    render json: @map.routes
  end

  def show
    render json: @route
  end

  def update
    @route.update_attributes(route_params)
    render json: @route
  end

  def destroy
    @route.destroy!
    render json: @route
  end

  private

  def load_map
    @map = Map.includes(:routes).find params[:map_id]
  end

  def load_route
    @route = Route.find params[:id]
  end

  def route_params
    params.require(:route).permit(:destination, :origin, :distance)
  end


end
