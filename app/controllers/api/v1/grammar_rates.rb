module API
  module V1
    class GrammarRates < Grape::API
      include API::V1::Defaults

      resource :grammar_rates do

        desc "Create a grammar rate.", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }
        params do
          requires :rate, type: String, desc: "grammar group rate"
          requires :grammar_group_id, type: Integer, desc: "ID of grammar group"
        end
        post do
          status 204
          authenticate!
          result = GrammarRate.find_or_initialize_by(user_id: current_user.id, grammar_group_id: params[:grammar_group_id])
          result.update(rate: params[:rate])
        end

        desc "get  my grammar rate.", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }

        get "" do
          authenticate!
          GrammarRate.where(user_id: current_user.id)
        end
      end
    end
  end
end