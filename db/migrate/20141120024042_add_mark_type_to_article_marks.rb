class AddMarkTypeToArticleMarks < ActiveRecord::Migration
  def change
    add_column :article_marks, :mark_type, :string
  end
end
