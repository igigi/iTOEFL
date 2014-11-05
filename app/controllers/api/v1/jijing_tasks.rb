module API
  module V1
    class JijingTasks < Grape::API
      include API::V1::Defaults

      resource :jijing_tasks do

        desc "get a task questions", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }
        get ":id", root: :jijing_questions do
          JijingTask.find(params[:id]).jijing_questions
        end
      end
    end
  end
end