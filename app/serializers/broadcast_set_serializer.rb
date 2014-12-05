class BroadcastSetSerializer < ApplicationSerializer
  attributes :id, :title, :description, :cover, :subscribe_count, :broadcast_count
  
  def broadcast_count
  	object.recorded_broadcasts.count 	
  end
end
