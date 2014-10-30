module API
  module V1
    class GrammarGroups < Grape::API
      include API::V1::Defaults

      resource :grammar_groups do

        desc "Return a grammar group"
        params do
          requires :id, type: Integer, desc: "ID of grammar group"
        end
        get ":id" do
          GrammarGroup.find(params[:id])
        end
      end
    end
  end
end