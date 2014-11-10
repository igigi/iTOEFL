module API
  module V1
    class VocabularyResults < Grape::API
      include API::V1::Defaults

      resource :vocabulary_results do

        desc "Create a vocabulary result."
        params do
          requires :user_id, type: Integer, desc: "id of user"
          requires :vocabulary_group_id, type: Integer, desc: "ID of group"
          requires :vocabulary_question_id, type: Integer, desc: "id of question"
        end
        post do
          status 204
          #authenticate!
          content_type "application/json"
          VocabularyResult.create!({
            vocabulary_question_id: params[:vocabulary_question_id],
            vocabulary_group_id: params[:vocabulary_group_id],
            user_id: params[:user_id]
          })
        end
      end
    end
  end
end