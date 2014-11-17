class CustomVocabularyGroupSerializer < ActiveModel::Serializer
  attributes :id, :sequence_number, :rate

  def rate
  	if VocabularyResult.find_by(vocabulary_group_id: object.id)
  	  VocabularyResult.where("user_id = ? AND vocabulary_group_id = ?", current_user.id, object.id).count / 100
  	else
  		-1
  	end
  end
end
