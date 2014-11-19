module API
  module V1
    class JijingGroups < Grape::API
      include API::V1::Defaults

      resource :jijing_groups do

        desc "Return the newest jijing groups", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }
        params do
          requires :question_type, type: String, desc: "1: kouyu or 2: xiezuo"
        end

        get "" do
          newest_group = JijingGroup.order("created_at").last
          if params[:question_type] == "1"
            render newest_group.jijing_questions.where(question_type: "1"), { meta: { name: "dkk" }, meta_key: :group }
          elsif params[:question_type] == "2"
            render newest_group.jijing_questions.where(question_type: "2"), { meta: { name: "kdkkdkd" }, meta_key: :group }
          end         
        end
      end
    end
  end
end