class OralGroupSerializer < ActiveModel::Serializer
  attributes :id, :sequence_number, :name

  def top_score
  	OralResult.where("user_id = ? AND oral_group_id =?", current_user.id, object.id)
  end
end
