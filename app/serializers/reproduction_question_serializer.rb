class ReproductionQuestionSerializer < ActiveModel::Serializer
  attributes :id, :content, :sequence_number, :top_score

  def top_score
  	result = current_user.reproduction_results.find_by(reproduction_question_id: object.id)
  	if result
  		result.score
  	else
  		""
  	end
  end
end
