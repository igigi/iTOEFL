# encoding: utf-8

class JijingMark < ActiveRecord::Base
  belongs_to :user
  belongs_to :jijing_answer

  after_save :set_answer_status
  after_create :set_message

  def formatted_time(date, format='%m月%d日')
    date.blank? ? nil : date.strftime(format)
  end

  private
  def set_answer_status
	  self.jijing_answer.update(status: 1)
  end

  def set_message
    jijing_answer_id = jijing_answer.id
    content = "您#{formatted_time(jijing_answer.created_at)}提交的作业已被批改"
    Message.create(user_id: user.id, content_id: jijing_answer_id, content_type: 2, content: content)
  end
end
