class CreateJudgements < ActiveRecord::Migration
  def change
    create_table :judgements do |t|
      t.integer :score
      t.references :mark, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
