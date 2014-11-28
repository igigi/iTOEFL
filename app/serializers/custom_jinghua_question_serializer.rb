class CustomJinghuaQuestionSerializer < ActiveModel::Serializer
  attributes :id, :content, :analysis, :answer_id

  def answer_id
  	if answer = current_user.jinghua_answers.where("jinghua_question_id = ?", object.id).where("status = ? OR status = ?", "0", "3").last
  		answer.id
  	else
  		nil
  	end
  end
end