module API
  module V1
    class Users < Grape::API
      include API::V1::Defaults

      resource :users do

        desc "modify password", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }
        params do
          requires :open_id, type: String, desc: "user open id"
          requires :password, type: String, desc: "user password"
          requires :new_password, type: String, desc: "user new_password"
        end
        post "/modify_password" do
          authenticate!
          user = User.find_by(open_id: params[:open_id])
          if user.password == params[:password]
             user.update(password: params[:new_password])
             status 204
             nil
          else
            status 200
            {error: "you have unmark answer"}
          end
        end

        desc "verify user open id"
        params do
          requires :open_id, type: String, desc: "user open id"
        end
        post "/verify_open_id" do
          authenticate!
          if user = User.find_by(open_id: params[:open_id])
            status 200
            {message: "open_id exist"}
          else
            status 200
            {message: "ok"}
          end
        end
      end
    end
  end
end