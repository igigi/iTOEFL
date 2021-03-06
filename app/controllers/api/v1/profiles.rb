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
          optional :avatar, type: String, desc: "avatar url"
          optional :nickname, type: String, desc: "nickname"
          optional :gender, type: String, desc: "male female"
          optional :grade, type: String, desc: "grade"
          optional :phone, type: String, desc: "user phone number"
        end
        post do
          status 204
          authenticate!
          # current_user.profile.update({
          #   avatar: params[:avatar],
          #   nickname: params[:nickname],
          #   gender: params[:gender],
          #   grade: params[:grade],
          #   phone: params[:phone]
          # })
          profile = current_user.profile
          profile.remote_avatar_url = params[:avatar]
          profile.nickname = params[:nickname]
          profile.gender = params[:gender]
          profile.grade = params[:grade]
          profile.phone = params[:phone]
          profile.save
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
