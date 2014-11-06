class JinghuaAnswer < ActiveRecord::Base
  belongs_to :user
  belongs_to :jinghua_question
  has_many :jinghua_marks, dependent: :destroy
end
