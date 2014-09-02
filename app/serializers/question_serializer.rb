class QuestionSerializer < ApplicationSerializer
  attributes :id, :content, :tip, :related_resource, :set, :number, :subject, :source, :difficulty
end
