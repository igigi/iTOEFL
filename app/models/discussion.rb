class Discussion < ActiveRecord::Base
  belongs_to :user
  #has_many :opinions, dependent: :destroy 
  has_many :opinions, as: :replied

  acts_as_votable
end
