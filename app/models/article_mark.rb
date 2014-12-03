# encoding: utf-8

class ArticleMark < ActiveRecord::Base
  belongs_to :user
  belongs_to :article
  has_one :article_judgement

  after_save :set_status
  after_create :set_message

  has_many :mark_tips, dependent: :destroy
  accepts_nested_attributes_for :mark_tips

  def formatted_time(date, format='%m月%d日')
    date.blank? ? nil : date.strftime(format)
  end



  private
  def set_status
    self.article.update(status: 1)
  end

  def set_message
    jijing_answer_id = article.id
    user_id = article.user_id
    content = "您#{formatted_time(article.created_at)}提交的作业已被批改"
    Message.create(user_id: user_id, content_id: jijing_answer_id, content_type: 3, content: content)
  end
end
