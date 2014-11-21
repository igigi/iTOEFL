module API
  module V1
    class JinghuaQuestions < Grape::API
      include API::V1::Defaults

      resource :jinghua_questions do

        desc "Return a jinghua question", {
          headers: {
            "Authorization" => {
              description: "Valdates your identity",
              required: true
            }
          }
        }
        params do
          requires :content_type, type: String, desc: "type of the jinghua question"
        end
        get "", root: "jinghua_questions", each_serializer: CustomJinghuaQuestionSerializer do
          JinghuaQuestion.where(content_type: params[:content_type])
        end
      end
    end
  end
end