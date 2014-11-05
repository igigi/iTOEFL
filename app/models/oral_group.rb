class OralGroup < ActiveRecord::Base
	has_many :oral_questions
	belongs_to :oral_origin
end
