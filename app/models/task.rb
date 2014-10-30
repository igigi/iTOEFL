class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :marks

  has_many :opinions, as: :replied, dependent: :destroy

  def self.myself_history(q,u)
    where("question_id = ? AND user_id = ?", q, u)
  end

  def self.other_history(q, u)
    where(question_id: q).where.not(user_id: u)
  end
end
