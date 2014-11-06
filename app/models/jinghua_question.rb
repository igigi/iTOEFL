class JinghuaQuestion < ActiveRecord::Base
	has_many :jinghua_answers, dependent: :destroy
	has_many :jinghua_marks, through: :jinghua_answers
end
