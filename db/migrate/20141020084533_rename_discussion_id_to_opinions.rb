class RenameDiscussionIdToOpinions < ActiveRecord::Migration
  change_table :opinions do |t|
    t.rename :discussion_id, :replied
  end
end
