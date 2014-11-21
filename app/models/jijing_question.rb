class JijingQuestion < ActiveRecord::Base
  belongs_to :jijing_group
  has_many :jijing_answers, dependent: :destroy
  has_many :jijing_marks, through: :jijing_answers
  has_many :jijing_samples
end
