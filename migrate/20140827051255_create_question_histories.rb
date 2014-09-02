class CreateExamHistories < ActiveRecord::Migration
  def change
    create_table :question_histories do |t|
      t.boolean :is_correct
      t.string :answer
      t.references :student, index: true
      t.references :question, index: true

      t.timestamps
    end
  end
end
