class CustomVocabularyGroupSerializer < ActiveModel::Serializer
  attributes :id, :sequence_number, :rate, :result_created_at

  private
  def rate
  	if result = VocabularyRate.where("vocabulary_group_id = ? AND user_id = ?", object.id, current_user.id).last
  		result.rate
  	else
  		"-1"
  	end
  end

  def result_created_at
    current_user.present? ? VocabularyRate.where(user_id: current_user.id).order("updated_at").last.created_at : nil
  end

end
