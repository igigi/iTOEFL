module API
  module V1
    class ReproductionResults < Grape::API
      include API::V1::Defaults

      resource :reproduction_results do

        desc "Create a reproduction result.", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }
        params do
          requires :score, type: Integer, desc: "reproduction score"
          requires :reproduction_question_id, type: Integer, desc: "ID of reproduction question"
        end
        post do
          status 204
          authenticate!
          result = ReproductionResult.find_or_initialize_by(user_id: current_user.id, reproduction_question_id: params[:reproduction_question_id])
          result.update(score: params[:score])
        end
      end
    end
  end
end