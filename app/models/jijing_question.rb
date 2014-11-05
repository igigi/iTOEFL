class JijingQuestion < ActiveRecord::Base
  belongs_to :jijing_task
  has_many :jijing_answers
  has_many :jijing_marks, through: :jijing_answers
end
