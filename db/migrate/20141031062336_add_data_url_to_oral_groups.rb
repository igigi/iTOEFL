class AddDataUrlToOralGroups < ActiveRecord::Migration
  def change
    add_column :oral_groups, :data_url, :string
  end
end
