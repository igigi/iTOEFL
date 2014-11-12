class CreateJinghuaJudgements < ActiveRecord::Migration
  def change
    create_table :jinghua_judgements do |t|
      t.integer :score
      t.references :jinghua_mark, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
