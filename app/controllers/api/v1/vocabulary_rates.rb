module API
  module V1
    class VocabularyRates < Grape::API
      include API::V1::Defaults

      resource :vocabulary_rates do

        desc "Create a vocabulary rate.", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }
        params do
          requires :rate, type: String, desc: "group rate"
          requires :vocabulary_group_id, type: Integer, desc: "ID of group"
        end
        post do
          status 204
          authenticate!
          result = VocabularyRate.find_or_initialize_by(user_id: current_user.id, vocabulary_group_id: params[:vocabulary_group_id])
          result.update(rate: params[:rate])
        end

        desc "get  my vocabulary rate.", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }

        get "" do
          authenticate!
          VocabularyRate.where(user_id: current_user.id)
        end
      end
    end
  end
end