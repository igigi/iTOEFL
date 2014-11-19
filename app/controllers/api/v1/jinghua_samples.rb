module API
  module V1
    class JinghuaSamples < Grape::API
      include API::V1::Defaults

      resource :jinghua_samples do

        desc "get a jinghua samples", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }
        params do
          requires "jinghua_question_id", type: Integer, desc: "jinghua question id"
        end

        get "" do
          authenticate!
          JinghuaQuestion.find(params[:jinghua_question_id]).jinghua_samples
        end
      end
    end
  end
end