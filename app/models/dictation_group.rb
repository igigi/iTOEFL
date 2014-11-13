class DictationGroup < ActiveRecord::Base
	has_many :dictation_questions, dependent: :destroy
end
