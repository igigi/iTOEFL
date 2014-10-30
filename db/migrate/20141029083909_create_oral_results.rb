class CreateOralResults < ActiveRecord::Migration
  def change
    create_table :oral_results do |t|
      t.references :user, index: true
      t.references :oral_group
      t.integer :score

      t.timestamps
    end
  end
end
