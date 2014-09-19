class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :question

  def self.myself_history(q,u)
    where("question_id = ? AND user_id = ?", q, u)
  end

  def self.other_history(q, u)
    where(question_id: q).where.not(user_id: u)
  end
end
