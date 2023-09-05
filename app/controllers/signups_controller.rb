class SignupsController < ApplicationController
    # rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def create
        signup = Signup.new(signup_params)
    
        if signup.save
          # Signup created successfully
          activity = signup.activity
          render json: activity_response(activity), status: :created
        else
          # Signup creation failed
          render json: { errors: signup.errors.full_messages }, status: :unprocessable_entity
        end
      end

    private

    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end
    
    def activity_response(activity)
        {
          id: activity.id,
          name: activity.name,
          difficulty: activity.difficulty
        }
    end

end
