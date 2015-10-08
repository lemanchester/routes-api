class Api::V1::MapsController < Api::V1::ApiController

  before_filter :load_map, only: [:show]

  def index
    render json: Map.all
  end

  def show
    render json: @map
  end

  private

  def load_map
    @map = Map.find params[:id]
  end

end
