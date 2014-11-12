module API
  module V1
    class TpoJudgements < Grape::API
      include API::V1::Defaults

      resource :tpo_judgements do

        desc "Create a tpo judgement.", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }
        params do
          requires :score, type: Integer, desc: "report content"
          requires :tpo_mark_id, type: Integer, desc: "ID of mark"
          requires :user_id, type: Integer, desc: "user ID"
        end
        post do
          authenticate!
          TpoJudgement.create!({
            score: params[:score],
            tpo_mark_id: params[:tpo_mark_id],
            user_id: params[:user_id]
          })
        end
      end
    end
  end
end