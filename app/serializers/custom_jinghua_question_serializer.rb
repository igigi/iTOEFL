class CustomJinghuaQuestionSerializer < ActiveModel::Serializer
  attributes :id, :content, :analysis, :answer_id

  def answer_id
  	if answer = current_user.jinghua_answers.where("jinghua_question_id = ? AND status = ? OR status = ?", object.id, "0", "3").last
  		answer.id
  	else
  		nil
  	end
  end
end