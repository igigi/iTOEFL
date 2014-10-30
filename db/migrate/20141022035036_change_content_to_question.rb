class ChangeContentToQuestion < ActiveRecord::Migration
  change_table :questions do |t|
    t.change :content, :text
  end
end
