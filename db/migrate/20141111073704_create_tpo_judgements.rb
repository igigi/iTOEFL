class CreateTpoJudgements < ActiveRecord::Migration
  def change
    create_table :tpo_judgements do |t|
      t.integer :score
      t.references :tpo_mark, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
