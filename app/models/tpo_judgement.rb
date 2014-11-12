class TpoJudgement < ActiveRecord::Base
  belongs_to :tpo_mark
  belongs_to :user
end
