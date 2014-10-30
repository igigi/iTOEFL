module API
  module V1
    class Squares < Grape::API
      include API::V1::Defaults


      namespace :squares do

        desc "Return my squares shared"

        params do
          requires :user_id, type: Integer, desc: "ID of user"
        end
        get "shared" do
          authenticate!
          my_squares = current_user.tasks + current_user.discussions
          my_squares.sort_by{|m| m.created_at }
        end

        desc "Return my squares replied", {
          headers: {
            "token" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }

        params do
          requires :user_id, type: Integer, desc: "ID of user"
        end
        get "replied", root: "square" do
          authenticate!
          my_squares = Opinion.where(user_id: params[:user_id])
          my_squares.sort_by{|m| m.created_at}
        end
      end
    end
  end
end