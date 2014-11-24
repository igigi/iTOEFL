module API
  module V1
    class JinghuaMarks < Grape::API
      include API::V1::Defaults

      resource :jinghua_marks do

        desc "Create a jinghua mark.", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }
        params do
          requires :content, type: String, desc: "mark content"
          requires :score, type: Integer, desc: "score of answer"
          requires :jinghua_answer_id, type: Integer, desc: "ID of jinghua question"
          requires :user_id, type: Integer, desc: "user ID"
        end
        post do
          authenticate!
          JinghuaMark.create!({
            content: params[:content],
            score: params[:score],
            jinghua_answer_id: params[:jinghua_answer_id],
            user_id: params[:user_id]
          })
        end
      end
    end
  end
end