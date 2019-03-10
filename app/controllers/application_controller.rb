# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from StandardError, with: :render_internal_server_error
  rescue_from ActionController::RoutingError, with: :render_not_found
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActionController::BadRequest, with: :render_bad_request
  rescue_from ActionController::ParameterMissing, with: :render_bad_request

  private

  def render_not_found(error = nil)
    render json: { error: error&.message }, status: :not_found
  end

  def render_bad_request(error = nil)
    render json: { error: error&.message }, status: :bad_request
  end

  def render_internal_server_error(error = nil)
    render json: { error: error&.message }, status: :internal_server_error
  end
end
