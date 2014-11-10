class CreateVocabularyResults < ActiveRecord::Migration
  def change
    create_table :vocabulary_results do |t|
      t.references :user, index: true
      t.references :vocabulary_question, index: true
      t.references :vocabulary_group, index: true

      t.timestamps
    end
  end
end
