module API
  module V1
    class JijingQuestions < Grape::API
      include API::V1::Defaults

      resource :jijing_questions do

        desc "Return the jijing groups question", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }
        params do
          requires :id, type: Integer, desc: "group id"
          requires :question_type, type: String, desc: "1: kouyu or 2: xiezuo"
        end

        # get "", each_serializer: CustomJijingQuestionSerializer do
        get "" do
          newest_group = JijingGroup.find(params[:id])
          # if params[:question_type] == "1"
          #   newest_group.jijing_questions.where(question_type: "1")
          # elsif params[:question_type] == "2"
          #   newest_group.jijing_questions.where(question_type: "2")
          # end
          if newest_group.present?
            newest_group.belong_questions(params[:question_type], current_user.id)
          else
            {error: 'no data'}
          end
        end
      end
    end
  end
end
