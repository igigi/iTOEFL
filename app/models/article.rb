class Article < ActiveRecord::Base
  belongs_to :user
  has_many :article_marks, dependent: :destroy

  def self.grap_one
  	self.where(status: 0).order("created_at").first
  end
end
