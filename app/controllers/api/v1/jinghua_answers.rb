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
          requires :user_id, type: Integer, desc: "user ID"
        end
        post do
          authenticate!
          if current_user.jinghua_answers.where("jinghua_question_id = ? AND status = ?", params[:jinghua_question_id], "0").last.nil?
            JinghuaAnswer.create!({
              remark: params[:remark],
              content: params[:content],
              status: 0,
              jinghua_question_id: params[:jinghua_question_id],
              user_id: params[:user_id]
            })
            status 204
          else            
            status 401
            {error: "you have unmark answer"}
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
        get ":id" do
          authenticate!
          JinghuaAnswer.find(params[:id])
        end
      end
    end
  end
end