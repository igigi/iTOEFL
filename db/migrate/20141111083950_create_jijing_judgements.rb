class CreateJijingJudgements < ActiveRecord::Migration
  def change
    create_table :jijing_judgements do |t|
      t.integer :score
      t.references :jijing_mark, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
