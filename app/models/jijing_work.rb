class JijingWork < ActiveRecord::Base
  belongs_to :jijing_group
  has_many :works
end
