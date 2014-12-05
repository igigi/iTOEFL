module API
  module V2
    class Profiles < Grape::API
      include API::V2::Defaults

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
          optional :avatar, type: Rack::Multipart::UploadedFile, desc: "avatar url"
          optional :nickname, type: String, desc: "nickname"
          optional :gender, type: String, desc: "male female"
          optional :grade, type: String, desc: "grade"
          optional :phone, type: String, desc: "user phone number"
        end
        post do
          status 204
          authenticate!
          current_user.profile.update({
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
