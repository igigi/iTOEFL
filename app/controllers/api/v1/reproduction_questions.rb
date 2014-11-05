module API
  module V1
    class ReproductionQuestions < Grape::API
      include API::V1::Defaults

      resource :reproduction_questions do

        desc "get a reproduction question", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }
        get "" do
          authenticate!
          ReproductionQuestion.all
        end

        desc "get a reproduction sample"

        get ":id", root: :reproduction_samples do
          ReproductionQuestion.find(params[:id]).reproduction_samples
        end
      end
    end
  end
end