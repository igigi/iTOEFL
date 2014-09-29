class Mark < ActiveRecord::Base
  belongs_to :task
  belongs_to :user

  after_save :set_task_status

  def set_tast_status
	  self.task.update(status: 1)
  end
end
