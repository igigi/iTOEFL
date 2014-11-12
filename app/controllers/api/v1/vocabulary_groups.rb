module API
  module V1
    class VocabularyGroups < Grape::API
      include API::V1::Defaults

      resource :vocabulary_groups do

        desc "Return a vocabulary group"

        get "/group", root: :vocabulary_groups, each_serializer: CustomVocabularyGroupSerializer do
          VocabularyGroup.all
        end

        desc "Return a vocabulary group"
        params do
          requires :sequence_number, type: Integer, desc: "vocabulary group sequence number"
          optional :page, type: Integer, desc: "info of page"
        end
        get "", root: :vocabulary_questions do
          vocabulary_questions = VocabularyGroup.find_by(sequence_number: params[:sequence_number]).vocabulary_questions
          if params[:page]
            vocabulary_questions.paginate(page: params[:page], per_page: 10)
          else
            vocabulary_questions
          end
        end
      end
    end
  end
end