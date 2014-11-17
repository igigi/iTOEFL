module API
  module V1
    class VocabularyFootprints < Grape::API
      include API::V1::Defaults

      resource :vocabulary_footprints do

        desc "print a vocabulary footprint.", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }
        params do
          requires :sequence_number, type: String, desc: "vocabulary sequence_number"
        end
        post do
          status 204
          authenticate!
          result = VocabularyFootprint.find_or_initialize_by(user_id: current_user.id, sequence_number: params[:sequence_number])
          result.update(sequence_number: params[:sequence_number])
        end

        desc "get my vocabulary footprint.", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }
        get "" do
          authenticate!
          VocabularyFootprint.find_by(user_id: current_user.id)
        end
      end
    end
  end
end