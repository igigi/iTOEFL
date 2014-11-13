class ArticleMark < ActiveRecord::Base
  belongs_to :user
  belongs_to :article
  has_one :article_judgement

  after_save :set_status

  def set_status
	  self.article.update(status: 1)
  end

  has_many :mark_tips, dependent: :destroy
  accepts_nested_attributes_for :mark_tips
end
