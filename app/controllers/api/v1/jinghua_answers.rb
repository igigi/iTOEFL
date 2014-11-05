module API
  module V1
    class JinghuaAnswers < Grape::API
      include API::V1::Defaults

      resource :jinghua_answers do

        desc "Create a jinghua answer.", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }
        params do
          requires :remark, type: String, desc: "jinghua answer remark"
          requires :content, type: String, desc: "jinghua answer content"
          requires :jinghua_question_id, type: Integer, desc: "jinghua question ID"
          requires :user_id, type: Integer, desc: "user ID"
        end
        post do
          authenticate!
          JinghuaAnswer.create!({
            remark: params[:remark],
            content: params[:content],
            jinghua_question_id: params[:jinghua_question_id],
            user_id: params[:user_id]
          })
        end

        desc "get share jinghua answer", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }
        params do
          requires :jinghua_question_id, type: Integer, desc: "ID of jinghua question"
        end
        get "", root: :jinghua_answers do
          authenticate!
          question = JinghuaQuestion.find(params[:jinghua_question_Id]).jinghua_answers.where.not(user: current_user)

          count = question.jinghua_answers.count
          max = question.jinghua_marks.maximum("score")
          average = question.jinghua_marks.average("score")

          answer_other = question.jinghua_answers.where.not(user: current_user)

          render answer_other, { meta: { count: count, max: max, average: average }, meta_key: :top_info }
        end
      end
    end
  end
end