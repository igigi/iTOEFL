module API
  module V1
    class OralResults < Grape::API
      include API::V1::Defaults

      resource :oral_results do

        desc "Create a report."
        params do
          requires :score, type: Integer, desc: "oral group score"
          requires :oral_group_id, type: Integer, desc: "ID of oral group"
          requires :user_id, type: Integer, desc: "user ID"
        end
        post do
          result = OralResult.find_or_initialize_by(user_id: params[:user_id], oral_group_id: params[:oral_group_id])
          result.update(score: params[:score])
          nil
        end
      end
    end
  end
end