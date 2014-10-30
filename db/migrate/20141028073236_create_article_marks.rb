class CreateArticleMarks < ActiveRecord::Migration
  def change
    create_table :article_marks do |t|
      t.references :user, index: true
      t.references :article, index: true
      t.string :score

      t.timestamps
    end
  end
end
