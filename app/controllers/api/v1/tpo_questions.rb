module API
  module V1
    class TpoQuestions < Grape::API
      include API::V1::Defaults

      resource :tpo_questions do

        desc "Return a tpo question"

        get ":id", root: "tpo_question", serializer: CustomTpoQuestionSerializer do
          TpoQuestion.find(params[:id])
        end
      end
    end
  end
end