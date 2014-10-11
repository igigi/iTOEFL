class Discussion < ActiveRecord::Base
  belongs_to :user
  has_many :opinions, dependent: :destroy 
end
