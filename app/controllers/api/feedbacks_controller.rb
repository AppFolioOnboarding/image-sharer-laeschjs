module Api
  class FeedbacksController < ApplicationController
    def create
      # Implement your create action
      f = Feedback.new(create_params)

      if f.save
        render json: { "result": 'success' }
      else
        first_error = f.errors.messages.first
        render json: { "result": first_error[0].to_s + ' ' + first_error[1][0] }
      end
    end

    private

    def create_params
      params.require(:feedback).permit(:name, :comment)
    end
  end
end
