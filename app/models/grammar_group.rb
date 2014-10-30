class GrammarGroup < ActiveRecord::Base
  has_many :grammar_questions
  belongs_to :grammar_type
end
