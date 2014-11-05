module API
  module V1
    class JijingGroups < Grape::API
      include API::V1::Defaults

      resource :jijing_groups do

        desc "Return the newest jinghua groups"
        params do
          requires :search, type: String, desc: "speaking or write"
        end

        get "" do
          newest_jijing = ijingGroup.order("created_at").last

          if params[:search] == "speaking"
            newest_jijing.jijing_tasks
          elsif params[:search] == "write"
            newest_jijing.jijing_works
          end
          
        end
      end
    end
  end
end