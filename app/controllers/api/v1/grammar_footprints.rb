module API
  module V1
    class GrammarFootprints < Grape::API
      include API::V1::Defaults

      resource :grammar_footprints do

        desc "get my grammar footprint.", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }
        get "",root: "grammar_footprint", serializer: CustomGrammarGroupSerializer do
          authenticate!
          if result = GrammarRate.where(user_id: current_user.id).last
            result.grammar_group 
          else
            nil
          end
        end
      end
    end
  end
end