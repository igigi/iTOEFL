# encoding: utf-8

class JinghuaQuestion < ActiveRecord::Base
	has_many :jinghua_answers, dependent: :destroy
	has_many :jinghua_marks, through: :jinghua_answers
	has_many :jinghua_samples, dependent: :destroy

  def self.type_messages(content_type, user_id)
    user = User.find(user_id)
    type_questions = JinghuaQuestion.where(content_type: content_type)
    # id, :content, :analysis, :answer_id#, :score, :type
    questions = {jinghua_questions: []}
    type_questions.each do |question|
      answer = user.jinghua_answers.where(jinghua_question_id: question.id).last
      answer_id = nil
      score = 0
      # type = 0 未做, type =1 未批, type=2 已批
      type = 0
      if answer
        answer_id = answer.id
        status = answer.status
        type = 1 if ['0', '3'].include?(status)
        if status == '1'
          type = 2
          score = answer.jinghua_marks.last.score
        end
      end
      question_message = {id: question.id, content: question.content, analysis: question.analysis, answer_id: answer_id, score: score, type: type}
      questions[:jinghua_questions].push(question_message)
    end
    questions
  end
end
