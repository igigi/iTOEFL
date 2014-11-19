class CustomVocabularyGroupSerializer < ActiveModel::Serializer
  attributes :id, :sequence_number, :rate

  def rate
  	if result = VocabularyRate.where("vocabulary_group_id = ? AND user_id = ?", object.id, current_user.id).last
  		result.rate
  	else
  		"-1"
  	end
  end

end
