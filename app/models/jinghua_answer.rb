class JinghuaAnswer < ActiveRecord::Base
  belongs_to :user
  belongs_to :jinghua_question
end
