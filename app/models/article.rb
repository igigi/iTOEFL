class Article < ActiveRecord::Base
  belongs_to :user

  def self.grap_one
  	self.where(status: 0).order("created_at").first
  end
end
