class CustomJijingQuestionSerializer < ActiveModel::Serializer
  attributes :id, :sequence_number, :content, :title, :answer_id

  def title
  	object.jijing_group.name
  end

  def answer_id
  	if answer = current_user.jijing_answers.where("jijing_question_id = ? AND status = ? OR status = ?", object.id, "0", "3").last
  		answer.id
  	else
  		nil
  	end
  end
end
