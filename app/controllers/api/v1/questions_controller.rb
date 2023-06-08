module Api
    module V1
      class QuestionsController < ApplicationController
        before_action :authenticate_user!
  
        def index
        if current_user
            questions = Question.all
            render json: { status: 'SUCCESS', message: 'Loaded questions', data: questions }, status: :ok
        end
        end
  
        def show
            if current_user 
                question_id = params[:id]
          question = Question.find_by(id: question_id)
          render json: {status: 'SUCCESS', message: 'Loaded answers', data:question}, status: :ok
            end
        end
  

        # test
        def create
            if current_user 
          question = Question.new(question_params)
                 if question.save
                    render json: {status: 'SUCCESS', message: 'Question has been saved', data:question}, status: :ok
                else
                    render json: {status: 'Error', message: 'Question is not saved', data:question.errors}, status: :unprocessable_entity
                end
            end
        end
  
        def update
            if current_user
                question_number = params[:id]
                question = Question.find_by(id: question_number)
                if question.update(question_params)
                    render json: {status: 'SUCCESS', message: 'Question is updated', data: question}, status: :ok
                else
                    render json: {status: 'Error', message: 'Question is not updated', data:question.errors}, status: :unprocessable_entity
                end
            end
        end
  
        def destroy
            if current_user
                question_number = params[:id]
                question = Question.find_by(id: question_number)
            question.destroy
          render json: {status: 'SUCCESS', message: 'Question successfully deleted', data:question}, status: :ok
            end
        end
  
        private
          def question_params
            params.permit(:id, :text, :category)
          end
  
      end
    end
  end