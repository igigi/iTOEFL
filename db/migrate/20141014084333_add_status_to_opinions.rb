class AddStatusToOpinions < ActiveRecord::Migration
  def change
    add_column :opinions, :status, :string
  end
end
