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
          optional :device, type: String, desc: "user device model"
          optional :system, type: String, desc: "user device system version"
          optional :app_version, type: String, desc: "app version"
          requires :contact, type: String, desc: " user contact"
        end
        post do
          status 204
          current_user.feedbacks.create!({
            content: params[:content],
            device: params[:device],
            system: params[:system],
            version: params[:app_version],
            contact: params[:contact]
          })
        end
      end
    end
  end
end