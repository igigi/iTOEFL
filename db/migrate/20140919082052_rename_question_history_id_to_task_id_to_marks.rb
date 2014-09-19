class RenameQuestionHistoryIdToTaskIdToMarks < ActiveRecord::Migration
  def change
    rename_column :marks, :question_history_id, :task_id
  end
end
