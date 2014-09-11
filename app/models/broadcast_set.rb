class BroadcastSet < ActiveRecord::Base
  has_many :recorded_broadcasts
  self.per_page = 10
end
