class PlanetsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

  def index
    render json: Planet.all
  end

  private

  def handle_record_not_found
    render json: { error: "Planet not found" }, status: :not_found
  end
end
