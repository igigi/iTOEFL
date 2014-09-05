class RbFavorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :recorded_broadcast, counter_cache: true
end
