class CreateWAnswers < ActiveRecord::Migration
  def change
    create_table :w_answers do |t|
      t.references :tpo_question, index: true
      t.references :user, index: true
      t.string :standpoint
      t.text :content

      t.timestamps
    end
  end
end
