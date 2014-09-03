class CreateQuestionHistories < ActiveRecord::Migration
  def change
    create_table :question_histories do |t|
      t.references :user, index: true
      t.references :question, index: true
      t.boolean :is_correct
      t.string :answer

      t.timestamps
    end
  end
end
