class OralGroupSerializer < ActiveModel::Serializer
  attributes :id, :sequence_number, :name, :data_url #, :top_score

  def name
    oral_origin = object.oral_origin
    if oral_origin.present?
      tpo_name = oral_origin.name
      tpo_name = tpo_name.present? ? tpo_name.gsub(/^[a-z]+/, 'TPO') : ''
    end
    "#{tpo_name}-#{object.name.try(:camelize)}"
  end

  def data_url
    oral_question = object.oral_questions.first
    oral_question.present? ? oral_question.data_url : ''
  end

  # def top_score
  # 	if result = OralResult.where("user_id = ? AND oral_group_id =?", current_user.id, object.id).first
  # 	  result.score
  # 	else
  # 	  nil
  # 	end
  # end
end
