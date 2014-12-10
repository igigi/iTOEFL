module API
  module V1
    class OralGroups < Grape::API
      include API::V1::Defaults

      resource :oral_groups do

        desc "Return all oral groups"

        get "" do
          OralGroup.all
        end

        desc "Return a oral group"

        get ":id", root: :oral_questions do
          oral_group = OralGroup.where(id: params[:id]).first
          oral_group.present? ? oral_group.oral_questions.order('CONVERT(sequence_number, SIGNED)') : {error: 'no data for this id'}
        end
      end
    end
  end
end
