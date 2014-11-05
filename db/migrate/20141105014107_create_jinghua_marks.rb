class CreateJinghuaMarks < ActiveRecord::Migration
  def change
    create_table :jinghua_marks do |t|
      t.string :content
      t.references :jinghua_answer, index: true
      t.references :user, index: true
      t.integer :score

      t.timestamps
    end
  end
end
