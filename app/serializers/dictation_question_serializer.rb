class DictationQuestionSerializer < ActiveModel::Serializer
  attributes :id, :sequence_number, :unit_id, :result_created_at

  private
  def unit_id
    object.dictation_group.id
  end

  def result_created_at
    DictationResult.where(user_id: current_user.id).last.created_at
  end
end
