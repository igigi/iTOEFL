class AddAvatarAndnicknameToJinghuaMark < ActiveRecord::Migration
  def change
    add_column :jinghua_marks, :avatar, :string
    add_column :jinghua_marks, :nickname, :string
  end
end
