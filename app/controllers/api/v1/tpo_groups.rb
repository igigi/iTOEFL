module API
  module V1
    class TpoGroups < Grape::API
      include API::V1::Defaults

      resource :tpo_groups do

        desc "Return question directory"
        get "", root: "tpo_group" do
          TpoGroup.all
        end
      end
    end
  end
end