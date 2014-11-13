class ArticleJudgement < ActiveRecord::Base
  belongs_to :article_mark
  belongs_to :user

  after_save :set_status

  def set_status
	  self.article_mark.article.update(status: 2)
  end
end
