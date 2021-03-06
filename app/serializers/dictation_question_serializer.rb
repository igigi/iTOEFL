class DictationQuestionSerializer < ActiveModel::Serializer
  attributes :id, :sequence_number, :unit_id, :result_created_at

  private
  def unit_id
    object.dictation_group.id
  end

  def result_created_at
    current_user.present? ? DictationResult.where(user_id: current_user.id).last.try(:updated_at) : nil
  end
end
