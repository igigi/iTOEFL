module API
  module V1
    class Questions < Grape::API
      include API::V1::Defaults

      resource :questions do

        desc "Return a question"
        params do
          requires :id, type: String, desc: "ID of the question"
        end
        get ":id", root: "question" do
          Question.where(permitted_params[:id]).first!
        end

        desc "Return 10 works per page"
        params do
          requires :id, type: Integer, desc: "ID of question"
          requires :page, type: String, desc: "page number"
        end
        get ":id/works", root: :works do
          Question.find(permitted_params[:id]).works.paginate(page: params[:page], per_page: 10)
        end
      end
    end
  end
end