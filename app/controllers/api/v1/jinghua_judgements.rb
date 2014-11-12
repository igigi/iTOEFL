module API
  module V1
    class JinghuaJudgements < Grape::API
      include API::V1::Defaults

      resource :jinghua_judgements do

        desc "Create a jinghua judgement.", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }
        params do
          requires :score, type: Integer, desc: "report content"
          requires :jinghua_mark_id, type: Integer, desc: "ID of mark"
          requires :user_id, type: Integer, desc: "user ID"
        end
        post do
          authenticate!
          JinghuaJudgement.create!({
            score: params[:score],
            jinghua_mark_id: params[:jinghua_mark_id],
            user_id: params[:user_id]
          })
        end
      end
    end
  end
end