class AddMediaTypeToDiscussions < ActiveRecord::Migration
  def change
    add_column :discussions, :media_type, :string
  end
end
