class AddRemarkAndShareToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :remark, :string
    add_column :tasks, :share, :boolean
  end
end
