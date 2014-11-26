class CustomSpeechMarkSerializer < ActiveModel::Serializer
  attributes :id, :score, :created_at, :jijing_answer, :user, :jijing_question

  def jijing_answer
  	{content: "#{object.jijing_answer.content}"}
  end

  def user
  	object.jijing_answer.user.profile
  end

  def jijing_question
  	{ content: object.jijing_answer.jijing_question.content, title: object.jijing_answer.jijing_question.jijing_group.name }
  end
end
