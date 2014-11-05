class RemoveDataUrlToOralQuestions < ActiveRecord::Migration
  def change
    remove_column :oral_questions, :data_url, :string
  end
end
