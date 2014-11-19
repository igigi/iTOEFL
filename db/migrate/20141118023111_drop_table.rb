class DropTable < ActiveRecord::Migration
  def change
  	drop_table :vocabulary_footprints
  	drop_table :jijing_tasks
  	drop_table :jijing_works
  end
end
