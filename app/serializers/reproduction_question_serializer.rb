class ReproductionQuestionSerializer < ActiveModel::Serializer
  attributes :id, :content, :sequence_number, :top_score

  def top_score
  	current_user.reproduction_results.where(reproduction_question: object).first.score
  end
end
