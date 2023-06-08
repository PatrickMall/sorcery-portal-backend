module Api
    module V1
      class MoodboardsController < ApplicationController
        before_action :authenticate_user!
  
        def index
            if current_user
          moodboards = current_user.moodboards
          render json: {status: 'SUCCESS', message: 'Loaded images', data: moodboards}, status: :ok
            end
        end
  
        def create
            if current_user 
          mood= Answer.new(answer_params)
          @answer.user_id= current_user.id
                 if @answer.save
                    render json: {status: 'SUCCESS', message: 'Answer is saved', data:@answer}, status: :ok
                else
                    render json: {status: 'Error', message: 'Answer is not saved', data:@answer.errors}, status: :unprocessable_entity
                end
            end
        end
  
        def destroy
            if current_user
                question_number = params[:id]
                @answer = current_user.answers.find_by(question_id: question_number)
                @answer.user_id= current_user.id
            @answer.destroy
          render json: {status: 'SUCCESS', message: 'Answer successfully deleted', data:@answer}, status: :ok
            end
        end

        def destroy_all
            if current_user
            @answers = current_user.answers
            @answers.destroy_all
            render json: {status: 'SUCCESS', message: 'Answers were all successfully deleted', data:@answers}, status: :ok
          end
        end
  
        private
          def answer_params
            params.permit(:question_id, :answer)
          end
  
      end
    end
  end