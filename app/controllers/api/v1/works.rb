module API
  module V1
    class Works < Grape::API
      include API::V1::Defaults

      resource :works do

        desc "Create a work."
        params do
          requires :standpoint, type: String, desc: "work stantpoint 0,1,-1"
          requires :content, type: String, desc: "work content"
          requires :question_id, type: Integer, desc: "question ID"
          requires :user_id, type: Integer, desc: "user ID"
        end
        post do
          Work.create!({
            standpoint: params[:standpoint],
            content: params[:content],
            question_id: params[:question_id],
            user_id: params[:user_id]
          })
        end

        desc "Return 10 works per page"
        params do
          requires :question_id, type: Integer, desc: "ID of question"
          requires :page, type: String, desc: "page number"
        end
        get "", root: :works do
          Question.find(params[:question_id]).works.order("id desc").paginate(page: params[:page], per_page: 10)
        end

        desc "Return works statistics infomation"
        params do
          requires :question_id, type:Integer, desc: "ID of question"
        end
        get "statistics" do
          {agree: "#{Work.where(standpoint: 1).count}", disagree: "#{Work.where(standpoint: -1).count}", neutral: "#{Work.where(standpoint: 0).count}"}
        end
      end
    end
  end
end