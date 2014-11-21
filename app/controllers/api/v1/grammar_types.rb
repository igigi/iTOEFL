module API
  module V1
    class GrammarTypes < Grape::API
      include API::V1::Defaults

      resource :grammar_types do

        desc "get my grammar type.", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }

        get "", _from: '_v1_grammar_types' do
          authenticate!
          GrammarType.all
        end
      end
    end
  end
end
