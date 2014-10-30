module API
  module V1
    class Reports < Grape::API
      include API::V1::Defaults

      resource :reports do

        desc "Create a report."
        params do
          requires :reportable_type, type: String, desc: "reportable_type: Discussion,Opinion,Task"
          requires :content, type: String, desc: "report content"
          requires :reportable_id, type: Integer, desc: "ID of thing reportable"
          requires :user_id, type: Integer, desc: "user ID"
        end
        post do
          Report.create!({
            reportable_type: params[:reportable_type],
            content: params[:content],
            reportable_id: params[:reportable_id],
            user_id: params[:user_id]
          })
        end
      end
    end
  end
end