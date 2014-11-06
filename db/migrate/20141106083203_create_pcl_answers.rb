class CreatePclAnswers < ActiveRecord::Migration
  def change
    create_table :pcl_answers do |t|
      t.references :tpo_question, index: true
      t.references :user, index: true
      t.integer :section_number
      t.string :is_correct
      t.string :option

      t.timestamps
    end
  end
end
