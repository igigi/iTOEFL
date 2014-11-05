class AddJijingWorkToWorks < ActiveRecord::Migration
  def change
    add_reference :works, :jijing_work, index: true
  end
end
