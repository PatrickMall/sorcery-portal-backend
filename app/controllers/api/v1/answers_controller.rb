module Api
    module V1
      class AnswersController < ApplicationController
        before_action :authenticate_user!
  
        def index
            if current_user
          @answers = current_user.answers
          render json: {status: 'SUCCESS', message: 'Loaded answers', data: @answers}, status: :ok
            end
        end
  
        def show
            if current_user 
                question_number = params[:id]
          @answer = current_user.answers.find_by(question_id: question_number)
          render json: {status: 'SUCCESS', message: 'Loaded answers', data: @answer}, status: :ok
            end
        end
  
        def create
            if current_user 
          @answer= Answer.new(answer_params)
          @answer.user_id= current_user.id
                 if @answer.save
                    render json: {status: 'SUCCESS', message: 'Answer is saved', data:@answer}, status: :ok
                else
                    render json: {status: 'Error', message: 'Answer is not saved', data:@answer.errors}, status: :unprocessable_entity
                end
            end
        end
  
        def update
            if current_user
                question_number = params[:id]
                @answer = current_user.answers.find_by(question_id: question_number).order(question_id: :desc)
                @answer.user_id= current_user.id
                if @answer.update(answer_params)
                    render json: {status: 'SUCCESS', message: 'answer is updated', data:@answer}, status: :ok
                else
                    render json: {status: 'Error', message: 'Answer is not updated', data:@answer.errors}, status: :unprocessable_entity
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