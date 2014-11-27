module API
  module V1
    class JijingGroups < Grape::API
      include API::V1::Defaults

      resource :jijing_groups do

        desc "Return the newest jijing yuce", {
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

        get "/yuce", root: "jijing_questions", each_serializer: CustomJijingQuestionSerializer do
          newest_group = JijingGroup.where(group_type: "1").order("created_at").last
          if params[:question_type] == "1"
            newest_group.jijing_questions.where(question_type: "1")
          elsif params[:question_type] == "2"
            newest_group.jijing_questions.where(question_type: "2")
          end         
        end

        desc "Return the newest jijing groups zhenti list", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }
        get "/zhenti" do
          JijingGroup.where(group_type: "2").order("created_at")      
        end
      end
    end
  end
end