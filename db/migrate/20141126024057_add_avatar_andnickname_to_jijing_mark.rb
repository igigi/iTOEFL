class AddAvatarAndnicknameToJijingMark < ActiveRecord::Migration
  def change
    add_column :jijing_marks, :avatar, :string
    add_column :jijing_marks, :nickname, :string
  end
end
