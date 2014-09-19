class RenameQuestionHistoryToTask < ActiveRecord::Migration
  def change
    rename_table :question_histories, :tasks
  end
end
