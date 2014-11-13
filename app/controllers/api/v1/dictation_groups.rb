module API
  module V1
    class DictationGroups < Grape::API
      include API::V1::Defaults

      resource :dictation_groups do

        desc "Return all dictation group"

        get "" do
          DictationGroup.all
        end
      end
    end
  end
end