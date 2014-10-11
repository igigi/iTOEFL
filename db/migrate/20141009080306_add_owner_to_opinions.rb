class AddOwnerToOpinions < ActiveRecord::Migration
  def change
    add_reference :opinions, :owner, index: true
  end
end
