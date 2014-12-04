# encoding: utf-8

class JijingGroup < ActiveRecord::Base
	has_many :jijing_questions

  def belong_questions(question_type, user_id)
    user = User.find(user_id)
    belong_questions = jijing_questions.where(question_type: question_type)
    questions = {jijing_questions: []}
    belong_questions.each do |question|
      case question_type
      when '1'
        answer = user.jijing_answers.where(jijing_question_id: question.id).last
      when '2'
        answer = user.articles.where(jijing_question_id: question.id).last
      end

      answer_id = nil
      score = 0
      # type = 0 未做, type =1 未批, type=2 已批
      type = 0
      if answer
        status = answer.status
        type = 1 if status == '0'
        if status == '1'
          type = 2 if status == '1'

          case question_type
          when '1'
            score = answer.jijing_marks.last.score
          when '2'
            score = answer.article_marks.last.score
          end

        end
        answer_id = answer.id if ['0', '3'].include?(status)
      end
      question_message = {id: question.id, sequence_number: question.sequence_number, content: question.content,
        analysis: question.analysis, title: name, answer_id: answer_id, score: score, type: type}
      questions[:jijing_questions].push(question_message)
    end
    questions
  end
end
