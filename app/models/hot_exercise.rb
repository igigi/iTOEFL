# encoding: utf-8

class HotExercise < ActiveRecord::Base
  # HOT_TYPE = {1 => '词汇', 2 => '语法', 3 => '听写', 4 => '写作', 5 => '记忆复写'}
  def self.hot_exercises(user_id)
    user = User.where(id: user_id).first
    exercises = {vocabulary_groups: {name: '词汇', hot_exercises: []}, grammar_groups: {name: '语法', hot_exercises: []},
                 dictation_groups: {name: '听写', hot_exercises: []}, writing_questions: {name: '写作批改', hot_exercises: []},
                 reproduction_questions: {name: '记忆复写', hot_exercises: []}, forecast_writings: {name: '写作机经', hot_exercises: []}}
    # 词汇 语法 听写
    exercise_types = {1 => 'vocabulary_groups', 2 => 'grammar_groups', 3 => 'dictation_groups', 4 => 'writing_questions', 5 => 'reproduction_questions'}
    exercise_types.each do |idx, exercise_type|
      exercise_class = idx == 4 ? JijingQuestion : exercise_type.classify.constantize
      exercise_class_sym = exercise_type.to_sym
      hot_exercise_records  = HotExercise.where(hot_type: idx)
      hot_exercise_records.each do |hot_exercise|
        exercise = exercise_class.find(hot_exercise.hot_type_id)
        sequence_number = idx == 3 ? exercise.name : exercise.sequence_number
        question_message = {id: exercise.id, sequence_number: sequence_number, exercise_count: hot_exercise.counter}
        question_message.merge!(content: exercise.content) if idx >= 4
        question_message.merge!(content_ch: exercise.content_ch) if idx == 5

        if idx == 4
          answer_id = nil
          score = 0
          # type = 0 未做, type =1 未批, type=2 已批
          type = 0

          if user
            answer = user.articles.where(jijing_question_id: exercise.id).last
            if answer
              answer_id = answer.id
              status = answer.status
              type = 1 if ['0', '3'].include?(status)
              if status == '1'
                type = 2
                score = answer.article_marks.last.score
              end
            end
          end

          jijing_group = exercise.jijing_group
          question_message.merge!(analysis: exercise.analysis, title: jijing_group.try(:name), answer_id: answer_id, score: score, type: type)
        end

        exercises[exercise_class_sym][:hot_exercises].push(question_message)
      end
    end

    last_jijing_group = JijingGroup.where(group_type: 1).order(created_at: :desc).first
    if last_jijing_group
      forecast_writings = last_jijing_group.jijing_questions.where(question_type: 2)
      forecast_writings.each do |writing|
        answer_id = nil
        score = 0
        # type = 0 未做, type =1 未批, type=2 已批
        type = 0

        if user
          answer = user.articles.where(jijing_question_id: writing.id).last
          if answer
            answer_id = answer.id
            status = answer.status
            type = 1 if ['0', '3'].include?(status)
            if status == '1'
              type = 2
              score = answer.article_marks.last.score
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

