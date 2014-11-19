module API
  module V1
    class VocabularyFootprints < Grape::API
      include API::V1::Defaults

      resource :vocabulary_footprints do

        desc "get my vocabulary footprint.", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }
        get "", root: "vocabulary_footprint", serializer: CustomVocabularyGroupSerializer do
          authenticate!
          if result = VocabularyRate.where(user_id: current_user.id).order("updated_at").last
            result.vocabulary_group 
          else
            nil
          end
        end
      end
    end
  end
end