class RemoveIndexToQuestions < ActiveRecord::Migration
  def change
	  remove_column :questions, :set 
	  remove_column :questions, :number
  end
end
