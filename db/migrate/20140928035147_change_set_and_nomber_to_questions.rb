class ChangeSetAndNomberToQuestions < ActiveRecord::Migration
  def change
	  change_column :questions, :set, :string
	  change_column :questions, :number, :string
  end
end
