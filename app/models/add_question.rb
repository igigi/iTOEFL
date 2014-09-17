class AddQuestion < ActiveRecord::Base
  belongs_to :mark
  belongs_to :user
end
