class JijingMark < ActiveRecord::Base
  belongs_to :user
  belongs_to :jijing_answer

  after_save :set_answer_status

  def set_answer_status
	  self.jijing_answer.update(status: 1)
  end
end
