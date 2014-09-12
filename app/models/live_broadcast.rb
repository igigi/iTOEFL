class LiveBroadcast < ActiveRecord::Base
  has_many :lb_comments, dependent: :destroy
end
