module API
  module V1
    class JijingJudgements < Grape::API
      include API::V1::Defaults

      resource :jijing_judgements do

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
          requires :jijing_mark_id, type: Integer, desc: "ID of mark"
          requires :user_id, type: Integer, desc: "user ID"
        end
        post do
          authenticate!
          JijingJudgement.create!({
            score: params[:score],
            jijing_mark_id: params[:jijing_mark_id],
            user_id: params[:user_id]
          })
        end
      end
    end
  end
end