class ScientistsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :handle_record_invalid

  def index
    render json: Scientist.all
  end

  def show
    scientist = find_record
    render json: scientist, serializer: ScientistsAndPlanetsSerializer
  end

  def create
    scientist = Scientist.create!(permitted_params)
    render json: scientist, status: :created
  end

  def update
    scientist = find_record
    scientist.update!(permitted_params)
    render json: scientist, status: :accepted
  end

  def destroy
    scientist = find_record
    scientist.destroy
    head :no_content
  end

  private

  def permitted_params
    params.permit(:name, :field_of_study, :avatar)
  end

  def find_record
    Scientist.find(params[:id])
  end

  def handle_record_not_found
    render json: { error: "Scientist not found" }, status: :not_found
  end

  def handle_record_invalid(exception)
    render json: {
             errors: exception.record.errors.full_messages
           },
           status: :unprocessable_entity
  end
end
