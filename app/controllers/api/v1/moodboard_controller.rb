module Api
    module V1
      class MoodboardController < ApplicationController
        before_action :authenticate_user!
  
        def index
            if current_user
          moodboards = current_user.moodboards
          render json: {status: 'SUCCESS', message: 'Loaded images', data: moodboards}, status: :ok
            end
        end
  
        def create
            if current_user 
          moodboard = Moodboard.new(moodboard_params)
          moodboard.user_id= current_user.id
                 if moodboard.save
                    render json: {status: 'SUCCESS', message: 'Image is saved', data:moodboard}, status: :ok
                else
                    render json: {status: 'Error', message: 'Image is not saved', data:moodboard.errors}, status: :unprocessable_entity
                end
            end
        end
  
        def destroy
            if current_user
                image_number = params[:id]
                moodboard = current_user.answers.find_by(id: image_number)
                moodboard.user_id= current_user.id
            moodboard.destroy
          render json: {status: 'SUCCESS', message: 'Image successfully deleted', data:moodboard}, status: :ok
            end
        end

  
        private
          def moodboard_params
            params.permit(:url)
          end
  
      end
    end
  end