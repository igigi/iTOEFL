class RbComment < ActiveRecord::Base
  belongs_to :user
  belongs_to :recorded_broadcast
  self.per_page = 10
end
