class CreateVocabularyRates < ActiveRecord::Migration
  def change
    create_table :vocabulary_rates do |t|
      t.references :user, index: true
      t.string :rate
      t.references :vocabulary_group, index: true

      t.timestamps
    end
  end
end
