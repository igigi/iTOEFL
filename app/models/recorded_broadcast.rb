class RecordedBroadcast < ActiveRecord::Base
  belongs_to :broadcast_set
  has_many :rb_favorites, dependent: :destroy
end
