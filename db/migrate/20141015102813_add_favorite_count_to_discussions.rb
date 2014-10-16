class AddFavoriteCountToDiscussions < ActiveRecord::Migration
  def change
    add_column :discussions, :favorite_count, :integer
  end
end
