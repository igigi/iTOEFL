module API
  module V1
    class Feedbacks < Grape::API
      include API::V1::Defaults

      resource :feedbacks do

        desc "Create a feedback.", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }
        params do
          requires :content, type: String, desc: "feedback content"
          requires :device, type: String, desc: "user device model"
          requires :system, type: String, desc: "user device system version"
          requires :app_version, type: String, desc: "app version"
        end
        post do
          status 204
          current_user.feedbacks.create!({
            content: params[:content],
            device: params[:device],
            system: params[:system],
            version: params[:app_version]
          })
        end
      end
    end
  end
end