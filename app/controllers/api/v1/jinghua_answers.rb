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
          optional :remark, type: String, desc: "jinghua answer remark"
          requires :content, type: String, desc: "jinghua answer content"
          requires :jinghua_question_id, type: Integer, desc: "jinghua question ID"
          requires :audio_length, type: Integer, desc: "audio length"
          requires :user_id, type: Integer, desc: "user ID"
        end
        post do
          authenticate!
          if current_user.jinghua_answers.where(jinghua_question_id: params[:jinghua_question_id]).last.nil?
            JinghuaAnswer.create!({
              remark: params[:remark],
              content: params[:content],
              audio_length: params[:audio_length],
              status: 0,
              jinghua_question_id: params[:jinghua_question_id],
              user_id: params[:user_id]
            })
            status 204
          else
            status 205
            {error: "you've done this question"}
          end
        end

        desc "get a jinghua answer", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }
        get ":id",root: "jinghua_answer", serializer: CustomJinghuaAnswerSerializer do
          authenticate!
          JinghuaAnswer.find(params[:id])
        end
      end
    end
  end
end
