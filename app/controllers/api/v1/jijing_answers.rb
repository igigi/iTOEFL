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
          optional :remark, type: String, desc: "jijing answer remark"
          requires :content, type: String, desc: "jijing answer content"
          requires :audio_length, type: String, desc: "audio length"
          requires :jijing_question_id, type: Integer, desc: "jijing question ID"
          requires :user_id, type: Integer, desc: "user ID"
        end
        post do
          if current_user.jijing_answers.where("jijing_question_id = ? AND status = ?", params[:jijing_question_id], "0").last.nil?
            JijingAnswer.create!({
              remark: params[:remark],
              content: params[:content],
              audio_length: params[:audio_length],
              status: 0,
              jijing_question_id: params[:jijing_question_id],
              user_id: params[:user_id]
            })
            status 204
          else            
            status 401
            {error: "you have unmark answer"}
          end
        end

        desc "get a jijing answer", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }
        get ":id", serializer: CustomJijingAnswerSerializer do
          authenticate!
          JijingAnswer.find(params[:id])
        end
      end
    end
  end
end