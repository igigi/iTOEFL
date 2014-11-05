module API
  module V1
    class Profiles < Grape::API
      include API::V1::Defaults

      resource :profiles do

        desc "Create a profile.", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }
        params do
          requires :avatar, type: String, desc: "avatar url"
          requires :nickname, type: String, desc: "nickname"
          requires :gender, type: String, desc: "male female"
          requires :grade, type: String, desc: "grade"
          requires :phone, type: String, desc: "user phone number"
        end
        post do
          status 204
          authenticate!
          current_user.create_profile!({
            avatar: params[:avatar],
            nickname: params[:nickname],
            gender: params[:gender],
            grade: params[:grade],
            phone: params[:phone]
          })
        end

        desc "get my profile", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }
        get "" do
          authenticate!
          current_user.profile
        end
      end
    end
  end
end