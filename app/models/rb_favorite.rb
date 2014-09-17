class RbFavorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :recorded_broadcast, counter_cache: true
  #validates :recorded_broadcast_id, uniqueness: { scope: :user_id, message: "should happen once per user" }
end
