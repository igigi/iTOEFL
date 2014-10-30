class SquareTaskSerializer < ApplicationSerializer
  attributes :id, :is_correct, :answer, :status, :created_at, :question
  #has_one :question
  def question
  	object.question
  end
end
