module API
  module V1
    class JijingSamples < Grape::API
      include API::V1::Defaults

      resource :jijing_samples do

        desc "get a jijing samples", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }
        params do
          requires "jijing_question_id", type: Integer, desc: "jijing question id"
        end

        get "" do
          authenticate!
          JijingQuestion.find(params[:jijing_question_id]).jijing_samples
        end
      end
    end
  end
end