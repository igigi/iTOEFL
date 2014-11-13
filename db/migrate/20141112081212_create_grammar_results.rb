class CreateGrammarResults < ActiveRecord::Migration
  def change
    create_table :grammar_results do |t|
      t.references :user, index: true
      t.references :grammar_question, index: true
      t.references :grammar_group, index: true

      t.timestamps
    end
  end
end
