module API
  module V1
    class JijingMarks < Grape::API
      include API::V1::Defaults

      resource :jijing_marks do

        desc "Create a jijing mark.", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }
        params do
          requires :content, type: String, desc: "content of mark"
          requires :score, type: Integer, desc: "score of answer"
          requires :jijing_question_id, type: Integer, desc: "question ID"
          requires :user_id, type: Integer, desc: "user ID"
        end
        post do
          authenticate!
          JijingMark.create!({
            content: params[:content],
            score: params[:score],
            jijing_question_id: params[:jijing_question_id],
            user_id: params[:user_id]
          })
        end
      end
    end
  end
end