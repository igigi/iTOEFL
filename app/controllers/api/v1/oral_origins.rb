module API
  module V1
    class OralOrigins < Grape::API
      include API::V1::Defaults

      resource :oral_origins do

        desc "get all oral origin"
        get "" do
          OralOrigin.joins(:oral_groups).distinct.order('oral_origins.id desc')
        end

        desc "get oral groups", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }

        get ":id", root: :oral_groups do
          oral_origin = OralOrigin.where(id: params[:id]).first
          oral_origin.present? ? oral_origin.oral_groups : {error: 'no data for this id'}
        end
      end
    end
  end
end
