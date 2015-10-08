class Api::V1::MapsController < ApplicationController

  def index
    render json: Map.all
  end

end
