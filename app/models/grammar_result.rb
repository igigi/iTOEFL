class GrammarResult < ActiveRecord::Base
  belongs_to :user
  belongs_to :grammar_question
  belongs_to :grammar_group
end
