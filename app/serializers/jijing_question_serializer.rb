class JijingQuestionSerializer < ActiveModel::Serializer
  attributes :id, :sequence_number, :content, :title, :answer_id
end
