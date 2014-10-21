class RenameRepliedToOpinions < ActiveRecord::Migration
  change_table :opinions do |t|
    t.rename :replied, :replied_id
    t.string :replied_type
  end
end
