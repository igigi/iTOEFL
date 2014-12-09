class CustomGrammarGroupSerializer < ActiveModel::Serializer
  attributes :id, :sequence_number, :result_created_at

  private
  def result_created_at
    current_user.present? ? GrammarResult.where(user_id: current_user.id).order("updated_at").last.created_at : nil
  end
end
