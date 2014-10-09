class AddScoreToMarks < ActiveRecord::Migration
  def change
    add_column :marks, :score, :integer
  end
end
