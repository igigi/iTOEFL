module API
  module V1
    class DictationQuestions < Grape::API
      include API::V1::Defaults

      resource :dictation_questions do

        desc "Return a question"
        params do
          requires :id, type: String, desc: "ID of the question"
        end
        get ":id", root: "dictation_question", serializer: CustomDictationQuestionSerializer do
          DictationQuestion.find(params[:id])
        end
      end
    end
  end
end