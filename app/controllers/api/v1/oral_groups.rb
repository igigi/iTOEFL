module API
  module V1
    class OralGroups < Grape::API
      include API::V1::Defaults

      resource :oral_groups do

        desc "Return all oral groups"

        get "" do
          OralGroup.all
        end

        desc "Return a oral group"

        get ":id" do
          OralGroup.find(params[:id]).oral_questions
        end
      end
    end
  end
end