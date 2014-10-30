class OralResult < ActiveRecord::Base
  belongs_to :user
  belongs_to :oral_group
end
