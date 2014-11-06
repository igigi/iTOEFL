class JijingAnswer < ActiveRecord::Base
  belongs_to :jijing_question
  belongs_to :user
  has_many :jijing_marks, dependent: :destroy
end
