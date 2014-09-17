class Mark < ActiveRecord::Base
  belongs_to :question_history
  belongs_to :user
end
