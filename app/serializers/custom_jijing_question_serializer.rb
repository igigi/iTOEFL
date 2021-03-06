class CustomJijingQuestionSerializer < ActiveModel::Serializer
  attributes :id, :sequence_number, :content, :analysis, :title, :answer_id

  def title
  	object.jijing_group.name
  end

  def answer_id
    if object.question_type == "1"
    	if answer = current_user.jijing_answers.where("jijing_question_id = ?", object.id).where("status = ? OR status = ?", "0", "3").last
    		answer.id
    	else
    		nil
    	end
    elsif object.question_type == "2"
      if answer = current_user.articles.where("jijing_question_id = ?", object.id).where("status = ? OR status = ?", "0", "3").last
        answer.id
      else
        nil
      end
    end
  end
end
