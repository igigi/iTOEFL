class AddMediaLengthToDiscussions < ActiveRecord::Migration
  def change
    add_column :discussions, :media_length, :string
  end
end
