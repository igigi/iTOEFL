class ArticleMark < ActiveRecord::Base
  belongs_to :user
  belongs_to :article

  has_many :mark_tips
  accepts_nested_attributes_for :mark_tips
end
