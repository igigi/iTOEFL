class Article < ActiveRecord::Base
  belongs_to :user
  has_many :article_marks, dependent: :destroy
  belongs_to :jijing_question

  def self.grap_one
  	self.where(status: 0).order("created_at").first
  end
end
