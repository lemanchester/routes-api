class Api::V1::ApiController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :render_404_error

  private

  def render_404_error(exception)
    render_api_error(exception, message: exception.message, status: :not_found)
  end

  # All uncaught exceptions for the API end up here.
  def render_api_error(exception, message: exception.message, status: :unprocessable_entity)
    render json: { error: message }, status: status
  end
end
