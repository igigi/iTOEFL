class CreateOral2Results < ActiveRecord::Migration
  def change
    create_table :oral2_results do |t|
      t.references :user, index: true
      t.references :oral_group, index: true
      t.integer :score
      t.text :audio

      t.timestamps
    end
  end
end
