class ReproductionResult < ActiveRecord::Base
  belongs_to :reproduction_question
  belongs_to :user
end
