class CreateAddQuestions < ActiveRecord::Migration
  def change
    create_table :add_questions do |t|
      t.string :content
      t.references :mark, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
