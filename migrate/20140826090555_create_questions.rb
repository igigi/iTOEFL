class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :created_by
      t.text :content
      t.string :tips
      t.string :resource_url
      t.integer :set, index: true
      t.integer :number, index: true
      t.string :subject
      t.string :source
      t.string :difficulty

      t.timestamps
    end
  end
end
