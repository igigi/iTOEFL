class CreateMarks < ActiveRecord::Migration
  def change
    create_table :marks do |t|
      t.string :content
      t.references :question_history, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
