module API
  module V1
    class OralOrigins < Grape::API
      include API::V1::Defaults

      resource :oral_origins do

        desc "get all oral origin"
        get "" do
          OralOrigin.all
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
          OralOrigin.find(params[:id]).oral_groups
        end
      end
    end
  end
end