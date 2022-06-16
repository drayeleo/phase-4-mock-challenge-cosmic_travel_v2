class ScientistsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :handle_record_invalid

  def index
    scientists = Scientist.all
    render json: scientists #, each_serializer: ScientistSerializer
    # render json: Scientist.all
  end

  def show
    scientist = Scientist.find(params[:id])
    render json: scientist, serializer: ScientistWithPlanetsSerializer
  end

  def create
    scientist = Scientist.create!(permitted_params)
    render json: scientist, status: :created
  end

  def update
    scientist = Scientist.find(params[:id])
    scientist.update!(permitted_params)
    render json: scientist, status: :accepted
  end

  def destroy
    scientist = Scientist.find(params[:id])
    scientist.destroy
    head :no_content
  end

  private

  def permitted_params
    params.permit(:name, :field_of_study, :avatar)
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
