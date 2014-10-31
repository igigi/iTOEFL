module API
  module V1
    class Articles < Grape::API
      include API::V1::Defaults

      resource :articles do

        desc "Create a article."
        params do
          requires :content, type: String, desc: "work content"
          requires :user_id, type: Integer, desc: "user ID"
        end
        post do
          Article.create!({
            content: params[:content],
            status: 0,
            user_id: params[:user_id]
          })
        end

        desc "get a article to mark"
        get "get_one" do
          Article.grap_one
        end
      end
    end
  end
end