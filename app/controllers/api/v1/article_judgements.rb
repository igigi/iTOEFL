module API
  module V1
    class ArticleJudgements < Grape::API
      include API::V1::Defaults

      resource :article_judgements do

        desc "Create a article judgement.", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }
        params do
          requires :score, type: Integer, desc: "report content"
          requires :article_mark_id, type: Integer, desc: "ID of article mark"
          requires :user_id, type: Integer, desc: "user ID"
        end
        post do
          authenticate!
          ArticleJudgement.create!({
            score: params[:score],
            article_mark_id: params[:article_mark_id],
            user_id: params[:user_id]
          })
        end
      end
    end
  end
end