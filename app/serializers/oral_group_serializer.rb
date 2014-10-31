class OralGroupSerializer < ActiveModel::Serializer
  attributes :id, :sequence_number, :name

  def top_score
  	if result = OralResult.where("user_id = ? AND oral_group_id =?", current_user.id, object.id).first
  	  result.score
  	else
  	  nil
  	end
  end
end
