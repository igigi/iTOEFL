class CreateVocabularyFootprints < ActiveRecord::Migration
  def change
    create_table :vocabulary_footprints do |t|
      t.references :user, index: true
      t.string :sequence_number

      t.timestamps
    end
  end
end
