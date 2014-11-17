class CreateGrammarRates < ActiveRecord::Migration
  def change
    create_table :grammar_rates do |t|
      t.references :user, index: true
      t.string :rate
      t.references :grammar_group, index: true

      t.timestamps
    end
  end
end
