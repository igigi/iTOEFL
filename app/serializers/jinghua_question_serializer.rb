class JinghuaQuestionSerializer < ActiveModel::Serializer
  attributes :id, :content, :analysis, :answer_id

  def answer_id
  	if answer = current_user.jinghua_answers.where("jinghua_question_id = ? AND status = ?", object.id, "0").last
  		answer.id
  	else
  		nil
  	end
  end
end
