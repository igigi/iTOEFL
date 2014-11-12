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
          article = Article.grap_one
          article.update(status: 1)
          article
        end

        desc "get count of article unmarked", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }
        get "count" do
          authenticate!
          count = Article.where(status: 0).count
          {count: count}
        end

        desc "get my article marked for teacher", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }
        params do
          requires :role, type: String, desc: "user role"
          requires :sort, type: String, desc: "sort condition, 0:unmark, 1:marked, 2:unjudgement"
          requires :page, type: String, desc: "page number"
        end
        get "" do
          authenticate!
          if params[:role] == "2"
            articles = []
            current_user.article_marks.order("id desc").each do |article_mark|
              articles << article_mark.article if article_mark.user == current_user
            end
            articles
          else
            current_user.articles.where(status: params[:sort]).paginate(page: params[:page], per_page: 10)
          end
        end
      end
    end
  end
end