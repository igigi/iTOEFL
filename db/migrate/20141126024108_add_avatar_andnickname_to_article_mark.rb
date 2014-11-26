class AddAvatarAndnicknameToArticleMark < ActiveRecord::Migration
  def change
    add_column :article_marks, :avatar, :string
    add_column :article_marks, :nickname, :string
  end
end
