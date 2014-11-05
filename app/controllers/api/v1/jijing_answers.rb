module API
  module V1
    class JijingAnswers < Grape::API
      include API::V1::Defaults

      resource :jijing_answers do

        desc "Create a jijing answer.", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }
        params do
          requires :remark, type: String, desc: "jijing answer remark"
          requires :content, type: String, desc: "jijing answer content"
          requires :jijing_question_id, type: Integer, desc: "jijing question ID"
          requires :user_id, type: Integer, desc: "user ID"
        end
        post do
          authenticate!
          JijingAnswer.create!({
            remark: params[:remark],
            content: params[:content],
            jijing_question_id: params[:jijing_question_id],
            user_id: params[:user_id]
          })
        end

        desc "get share jijing answer", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }
        params do
          requires :jijing_question_id, type: Integer, desc: "ID of jijing question"
        end
        get "", root: :jijing_answers do
          authenticate!
          question = JijingQuestion.find(params[:jijing_question_Id]).jijing_answers.where.not(user: current_user)

          count = question.jijing_answers.count
          max = question.jijing_marks.maximum("score")
          average = question.jijing_marks.average("score")

          answer_other = question.jijing_answers.where.not(user: current_user)

          render answer_other, { meta: { count: count, max: max, average: average }, meta_key: :top_info }
        end
      end
    end
  end
end