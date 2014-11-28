class CreateHotExercises < ActiveRecord::Migration
  def change
    create_table :hot_exercises do |t|
      t.integer :hot_type_id
      t.integer :hot_type
      t.integer :counter

      t.timestamps
    end
  end
end
