class ChangeIndexToQuestions < ActiveRecord::Migration
  def change
	  change_column :questions, :set, :string, index: false
	  change_column :questions, :number, :string, index: false
  end
end
