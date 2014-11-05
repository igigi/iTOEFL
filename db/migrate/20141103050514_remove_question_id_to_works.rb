class RemoveQuestionIdToWorks < ActiveRecord::Migration
  def change
    remove_reference :works, :question, index: true
  end
end
