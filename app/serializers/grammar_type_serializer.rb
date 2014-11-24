class GrammarTypeSerializer < ActiveModel::Serializer
  embed :ids
  attributes :name
  has_many :grammar_groups

  private

  def include_grammar_groups?
    @options[:_from] != '_v1_grammar_types'
  end

  def attributes
    hash = super

    if @options[:_from] == '_v1_grammar_types'
      hash[:grammar_groups] = []
      object.grammar_groups.each do |grammar_group|
        question_message = {id: grammar_group.id, sequence_number: grammar_group.sequence_number, grammar_questions: grammar_group.grammar_questions.ids}
        relation = GrammarResult.where(grammar_group_id: grammar_group.id, user_id: current_user.id)
        if relation.exists?
          grammar_result_ids = relation.where('grammar_question_id IS NOT NULL').ids
          question_message.merge!(grammar_results: grammar_result_ids)
        end
        hash[:grammar_groups].push(question_message)
      end
    end

    hash
  end
end
