class JinghuaMark < ActiveRecord::Base
  belongs_to :jinghua_answer
  belongs_to :user

  after_save :set_answer_status

  def set_answer_status
	  self.jinghua_answer.update(status: 1)
  end
end
