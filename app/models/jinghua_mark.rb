# encoding: utf-8

class JinghuaMark < ActiveRecord::Base
  belongs_to :jinghua_answer
  belongs_to :user

  after_save :set_answer_status
  after_create :set_message

  def formatted_time(date, format='%m月%d日')
    date.blank? ? nil : date.strftime(format)
  end

  private
  def set_answer_status
	  self.jinghua_answer.update(status: 1)
  end

  def set_message
    jinghua_answer_id = jinghua_answer.id
    content = "您#{formatted_time(jinghua_answer.created_at)}提交的作业已被批改"
    Message.create(user_id: user.id, content_id: jinghua_answer_id, content_type: 1, content: content)
  end
end
