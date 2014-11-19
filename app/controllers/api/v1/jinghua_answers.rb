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
          requires :is_shared, type: String, desc: "0,1"
          requires :content, type: String, desc: "jinghua answer content"
          requires :jinghua_question_id, type: Integer, desc: "jinghua question ID"
          requires :user_id, type: Integer, desc: "user ID"
        end
        post do
          status 204
          authenticate!
          JinghuaAnswer.create!({
            remark: params[:remark],
            content: params[:content],
            status: 0,
            is_shared: params[:is_shared],
            jinghua_question_id: params[:jinghua_question_id],
            user_id: params[:user_id]
          })
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