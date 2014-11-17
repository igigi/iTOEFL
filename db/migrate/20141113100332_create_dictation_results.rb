class CreateDictationResults < ActiveRecord::Migration
  def change
    create_table :dictation_results do |t|
      t.text :content
      t.references :dictation_question, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
