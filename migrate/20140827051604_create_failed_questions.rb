class CreateFailedQuestions < ActiveRecord::Migration
  def change
    create_table :failed_questions do |t|
      t.references :student, index: true
      t.references :question, index: true

      t.timestamps
    end
  end
end
