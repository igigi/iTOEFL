class Opinion < ActiveRecord::Base
  belongs_to :discussion
  belongs_to :user

  has_many :guests, class_name: "opinion", foreign_key: "owner_id"
  belongs_to :owner, class_name: "opinion"
end
