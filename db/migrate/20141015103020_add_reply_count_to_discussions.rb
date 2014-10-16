class AddReplyCountToDiscussions < ActiveRecord::Migration
  def change
    add_column :discussions, :reply_count, :integer
  end
end
