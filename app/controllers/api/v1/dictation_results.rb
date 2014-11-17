module API
  module V1
    class DictationResults < Grape::API
      include API::V1::Defaults

      resource :dictation_results do

        desc "Create a result.", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }
        params do
          requires :content, type: String, desc: "answer content"
          requires :dictation_question_id, type: Integer, desc: "ID of question"
        end
        post do
          status 204
          authenticate!
          result = DictationResult.find_or_initialize_by(user_id: current_user.id, dictation_question_id: params[:dictation_question_id])
          result.update(content: params[:content])
        end
      end
    end
  end
end