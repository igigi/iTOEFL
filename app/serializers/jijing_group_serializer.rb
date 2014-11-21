class JijingGroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :jijing_questions

  def jijing_questions
  	object.jijing_questions.where(question_type: "1")
  end
end
