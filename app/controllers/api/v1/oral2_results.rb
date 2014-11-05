module API
  module V1
    class Oral2Results < Grape::API
      include API::V1::Defaults

      resource :oral2_results do

        desc "Create a oral2 result.", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }
        params do
          requires :score, type: Integer, desc: "oral group score"
          requires :oral_group_id, type: Integer, desc: "ID of oral group"
          requires :user_id, type: Integer, desc: "user ID"
          requires :audio, type: String, desc: "audio url"
        end
        post do
          status 204
          authenticate!
          result = Oral2Result.find_or_initialize_by(user_id: params[:user_id], oral_group_id: params[:oral_group_id])
          result.update(score: params[:score], audio: params[:audio])
        end

        desc "get a oral group ranking list"
        params do
          requires :oral_group_id, type: Integer, desc: "ID of oral group"
        end
        get "" do
          Oral2Result.where(oral_group_id: params[:oral_group_id]).order("score desc").limit(10)
        end
      end
    end
  end
end