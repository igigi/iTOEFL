class Discussion < ActiveRecord::Base
  belongs_to :user

  has_many :opinions, as: :replied, dependent: :destroy

  acts_as_votable
end
