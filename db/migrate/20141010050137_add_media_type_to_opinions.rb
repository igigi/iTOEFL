class AddMediaTypeToOpinions < ActiveRecord::Migration
  def change
    add_column :opinions, :media_type, :string
  end
end
