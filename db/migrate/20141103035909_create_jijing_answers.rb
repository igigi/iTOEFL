class CreateJijingAnswers < ActiveRecord::Migration
  def change
    create_table :jijing_answers do |t|
      t.references :jijing_question, index: true
      t.references :user, index: true
      t.string :content
      t.string :is_shared
      t.string :remark
      t.string :status

      t.timestamps
    end
  end
end
