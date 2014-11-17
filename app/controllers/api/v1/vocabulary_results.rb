module API
  module V1
    class VocabularyResults < Grape::API
      include API::V1::Defaults

      resource :vocabulary_results do

        desc "get error vocabulary question", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }

        params do
          requires :vocabulary_group_id, type: Integer, desc: "id"
        end
        get "" do
          VocabularyResult.where("user_id = ? AND vocabulary_group_id = ?", current_user.id, params[:vocabulary_group_id])
        end

        desc "delete a vocabulary result"
        params do
          requires :vocabulary_result, type: String, desc: "id,ex 1,2,3"
        end

        delete "" do
          params[:vocabulary_result].split(",").each do |id|
            VocabularyResult.find(id).destroy
          end
          nil
        end
      end
    end
  end
end