class DictationResult < ActiveRecord::Base
  belongs_to :dictation_question
  belongs_to :user
end
