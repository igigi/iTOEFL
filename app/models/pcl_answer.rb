class PclAnswer < ActiveRecord::Base
  belongs_to :tpo_question
  belongs_to :user
end
