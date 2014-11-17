module API
  module V1
    class DictationFootprints < Grape::API
      include API::V1::Defaults

      resource :dictation_footprints do

        desc "get my dictation footprint.", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }
        get "" do
          authenticate!
          DictationResult.where(user_id: current_user.id).last.dictation_question
        end
      end
    end
  end
end