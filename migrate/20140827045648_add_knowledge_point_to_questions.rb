class AddKnowledgePointToQuestions < ActiveRecord::Migration
  def change
    add_reference :questions, :knowledge_point, index: true
  end
end
