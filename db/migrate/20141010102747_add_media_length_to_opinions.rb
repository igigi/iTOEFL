class AddMediaLengthToOpinions < ActiveRecord::Migration
  def change
    add_column :opinions, :media_length, :string
  end
end
