class AddTextContentToMarkTips < ActiveRecord::Migration
  def change
    add_column :mark_tips, :text_content, :text
  end
end
