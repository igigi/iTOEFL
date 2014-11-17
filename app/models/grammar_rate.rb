class GrammarRate < ActiveRecord::Base
  belongs_to :user
  belongs_to :grammar_group
end
