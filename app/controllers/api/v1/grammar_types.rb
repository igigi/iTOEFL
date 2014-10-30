module API
  module V1
    class GrammarTypes < Grape::API
      include API::V1::Defaults

      resource :grammar_types do

        desc "Return question type"

        get "" do
          GrammarType.all
        end
      end
    end
  end
end