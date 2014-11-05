class JijingQuestionSerializer < ActiveModel::Serializer
  attributes :id, :sequence_number, :content, :my_history

    def my_history
  	current_user.jijing_answers.where(jijing_question_id: object.id)
  end
end
