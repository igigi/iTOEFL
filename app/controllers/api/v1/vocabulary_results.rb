module API
  module V1
    class VocabularyResults < Grape::API
      include API::V1::Defaults

      resource :vocabulary_results do

        desc "Create a vocabulary result.", hidden: true

        params do
          requires :vocabulary_results, type: Array do
            requires :vocabulary_group_id
            requires :vocabulary_question_id
            requires :user_id
          end
        end

        post do
          status 204
          #authenticate!
          content_type "application/json"
          VocabularyResult.create!({
            vocabulary_question_id: params[:vocabulary_question_id],
            vocabulary_group_id: params[:vocabulary_group_id],
            user_id: params[:user_id]}
          )
        end
      end
    end
  end
end