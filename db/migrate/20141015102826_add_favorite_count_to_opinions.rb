class AddFavoriteCountToOpinions < ActiveRecord::Migration
  def change
    add_column :opinions, :favorite_count, :integer
  end
end
