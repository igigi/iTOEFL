class CreateReproductionResults < ActiveRecord::Migration
  def change
    create_table :reproduction_results do |t|
      t.integer :score
      t.references :reproduction_question, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
