class AddSetAndNumberToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :set, :string
    add_column :questions, :number, :string
  end
end
