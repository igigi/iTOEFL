class CreateTAnswers < ActiveRecord::Migration
  def change
    create_table :t_answers do |t|
      t.references :tpo_question, index: true
      t.references :user, index: true
      t.string :content
      t.string :is_shared
      t.string :status

      t.timestamps
    end
  end
end
