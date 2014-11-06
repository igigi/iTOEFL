module API
  module V1
    class ArticleMarks < Grape::API
      include API::V1::Defaults

      resource :article_marks do

        desc "Create a article mark."
        params do
          requires :article_mark, type: Hash do
            requires :user_id, type: Integer
            requires :article_id, type: Integer
            requires :score, type: String
            requires :mark_tips_attributes, type: Array do
              requires :start_index, type: Integer
              requires :end_index, type: Integer
              requires :audio_url, type: String
            end
          end
        end
        post do
          ArticleMark.create(params[:article_mark])
        end
      end
    end
  end
end