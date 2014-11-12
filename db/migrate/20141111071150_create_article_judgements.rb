class CreateArticleJudgements < ActiveRecord::Migration
  def change
    create_table :article_judgements do |t|
      t.integer :score
      t.references :article_mark, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
