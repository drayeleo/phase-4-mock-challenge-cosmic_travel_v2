class MissionsController < ApplicationController
  def create
    mission = Mission.create!(permitted_params)
    render json: mission.planet, status: :created, serializer: PlanetSerializer
  end

  private

  def permitted_params
    params.permit(:name, :scientist_id, :planet_id)
  end

  def handle_record_invalid(exception)
    render json: {
             errors: exception.record.errors.full_messages
           },
           status: :unprocessable_entity
  end
end
