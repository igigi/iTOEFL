class CreateJijingMarks < ActiveRecord::Migration
  def change
    create_table :jijing_marks do |t|
      t.string :content
      t.references :jijing_answer, index: true
      t.references :user, index: true
      t.integer :score

      t.timestamps
    end
  end
end
