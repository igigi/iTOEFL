class JinghuaQuestionSerializer < ActiveModel::Serializer
  attributes :id, :content, :my_history

  def my_history
  	current_user.jinghua_answers.where(jinghua_question_id: object.id)
  end
end
