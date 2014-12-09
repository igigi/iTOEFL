# encoding: utf-8

module API
  module V1
    class HotExercises < Grape::API
      include API::V1::Defaults

      resource :hot_exercises do

        desc "Return hot exercises."

        get "" do
          exercises = HotExercise.hot_exercises
          last_jijing_group = JijingGroup.where(group_type: 1).order(created_at: :desc).first
          if last_jijing_group
            forecast_writings = last_jijing_group.jijing_questions.where(question_type: 2)
            forecast_writings.each do |writing|
              answer_id = nil
              score = 0
              # type = 0 未做, type =1 未批, type=2 已批
              type = 0

              if current_user
                answer = current_user.articles.where(jijing_question_id: writing.id).last
                if answer
                  answer_id = answer.id
                  status = answer.status
                  type = 1 if ['0', '3'].include?(status)
                  if status == '1'
                    type = 2

                    case question_type
                    when '1'
                      score = answer.jijing_marks.last.score
                    when '2'
                      score = answer.article_marks.last.score
                    end

                  end
                end
              end
              question_message = {id: writing.id, content: writing.content, sequence_number: writing.sequence_number, analysis: writing.analysis,
                                  title: last_jijing_group.name, answer_id: answer_id, score: score, type: type}
              exercises[:forecast_writings][:hot_exercises].push(question_message)
            end
          end
          exercises
        end
      end
    end
  end
end
