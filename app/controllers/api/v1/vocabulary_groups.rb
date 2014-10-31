module API
  module V1
    class VocabularyGroups < Grape::API
      include API::V1::Defaults

      resource :vocabulary_groups do

        desc "Return a vocabulary group"
        params do
          requires :sequence_number, type: Integer, desc: "ID of vocabulary group sequence number"
          requires :page, type: Integer, desc: "info of page"
        end
        get "", root: :vocabulary_questions do
          VocabularyGroup.find_by(sequence_number: params[:sequence_number]).vocabulary_questions.paginate(page: params[:page], per_page: 10)
        end
      end
    end
  end
end