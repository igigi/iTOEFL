class Opinion < ActiveRecord::Base
  before_create :set_seat
  belongs_to :discussion, counter_cache: :reply_count
  belongs_to :user

  has_many :guests, class_name: "Opinion", foreign_key: "owner_id"
  belongs_to :owner, class_name: "Opinion"

  def set_seat
  	self.seat = self.discussion.opinions.size
  end
end
