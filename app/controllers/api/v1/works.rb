module API
  module V1
    class Works < Grape::API
      include API::V1::Defaults

      resource :works do

        desc "Create a work."
        params do
          requires :standpoint, type: String, desc: "work stantpoint 0,1,-1"
          requires :content, type: String, desc: "work content"
          requires :jijing_work_id, type: Integer, desc: "question ID"
          requires :user_id, type: Integer, desc: "user ID"
        end
        post do
          Work.create!({
            standpoint: params[:standpoint],
            content: params[:content],
            question_id: params[:jijing_work_id],
            user_id: params[:user_id]
          })
        end

        desc "Return 10 works per page"
        params do
          requires :jijing_work_id, type: Integer, desc: "ID of question"
          requires :page, type: String, desc: "page number"
        end
        get "", root: :works do
          JijingWork.find(params[:jijing_work_id]).works.order("id desc").paginate(page: params[:page], per_page: 10)
        end

        desc "Return works statistics infomation"
        params do
          requires :jijing_work_id, type:Integer, desc: "ID of question"
        end
        get "statistics" do
          jijing_work = JijingWork.find(params[:jijing_work_id])
          {agree: "#{jijing_work.works.where(standpoint: 1).count}", disagree: "#{jijing_work.works.where(standpoint: -1).count}", neutral: "#{jijing_work.works.where(standpoint: 0).count}"}
        end
      end
    end
  end
end