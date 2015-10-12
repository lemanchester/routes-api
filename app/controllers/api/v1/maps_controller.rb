class Api::V1::MapsController < Api::V1::ApiController

  before_filter :load_map, only: [:show, :update, :destroy]

  def index
    render json: Map.all
  end

  def show
    render json: @map
  end

  def update
    @map.update_attributes(map_params)
    render json: @map
  end

  def destroy
    @map.destroy!
    render json: @map
  end

  private

  def load_map
    @map = Map.find params[:id]
  end

  def map_params
    params.require(:map).permit(:name)
  end

end
