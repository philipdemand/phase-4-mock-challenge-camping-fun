class CampersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        campers = Camper.all
        render json: campers
    end

    def show
        camper = Camper.find(params[:id])
        render json: camper, include: :activities
    end

    def create
        new_camper = Camper.create(camper_params)
        if new_camper.save
            render json: new_camper, status: :created
        else
            render json: { errors: new_camper.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private

    def render_not_found_response
        render json: { error: "Camper not found" }, status: :not_found
    end
    
    def camper_params
        params.permit(:name, :age)
    end

end
