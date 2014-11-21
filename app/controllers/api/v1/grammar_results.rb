module API
  module V1
    class GrammarResults < Grape::API
      include API::V1::Defaults

      resource :grammar_results do

        desc "get  my grammar results", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }

        get "" do
          authenticate!
          user_id = current_user.id
          user_result = GrammarResult.where(user_id: user_id)
          result = []
          id_array = user_result.pluck(:grammar_group_id)
          id_array.each do |id|
            result << { id => user_result.where(grammar_group_id: id).pluck(:grammar_question_id)}
          end
          result
        end
      end
    end
  end
end