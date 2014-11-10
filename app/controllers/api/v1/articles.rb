module API
  module V1
    class Articles < Grape::API
      include API::V1::Defaults

      resource :articles do

        desc "Create a article.", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }
        params do
          requires :content, type: String, desc: "work content"
          requires :user_id, type: Integer, desc: "user ID"
        end
        post do
          authenticate!
          Article.create!({
            content: params[:content],
            status: 0,
            user_id: params[:user_id]
          })
        end

        desc "get a article to mark", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }
        get "get_one", serializer: CustomArticleSerializer do
          authenticate!
          Article.grap_one
        end

        desc "get my article", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }
        get "" do
          authenticate!
          current_user.articles
        end
      end
    end
  end
end