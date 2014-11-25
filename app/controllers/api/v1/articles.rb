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
          requires :jijing_question_id, type: Integer, desc: "jijing question id"
          requires :user_id, type: Integer, desc: "user ID"
        end
        post do
          authenticate!
          Article.create!({
            content: params[:content],
            status: 0,
            jijing_question_id: params[:jijing_question_id],
            user_id: params[:user_id]
          })
        end

        desc "get a jijing article answer", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }
        get ":id" do
          authenticate!
          Article.find(params[:id])
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
          article.update(status: 3)
          article
        end

        desc "cancel a article to mark", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }
        delete ":id" do
          authenticate!
          article = Article.find(params[:id])
          article.update(status: 0)
          nil
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
          requires :sort, type: String, desc: "sort condition, 0:unmark, 1:marked, 2:unjudgement"
          requires :page, type: String, desc: "page number"
        end
        get "" do
          authenticate!
          if params[:sort] == "0"
            current_user.articles.where("status = ? OR status = ?", params[:sort], 3).paginate(page: params[:page], per_page: 10)
          elsif params[:sort] == "1"
            current_user.articles.where("status = ? OR status = ?", params[:sort], 2).paginate(page: params[:page], per_page: 10)
          else
            current_user.articles.where(status: 1).paginate(page: params[:page], per_page: 10)
          end
        end
      end
    end
  end
end