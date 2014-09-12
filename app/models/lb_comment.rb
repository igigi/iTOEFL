class LbComment < ActiveRecord::Base
  belongs_to :user
  belongs_to :live_broadcast
end
