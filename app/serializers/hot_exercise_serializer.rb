# encoding: utf-8

class HotExerciseSerializer < ActiveModel::Serializer
  attributes :hot_exercises #hot_type_id, hot_type, :counter

  private
  def hot_exercises
    exercises = {vocabulary_groups: {name: '词汇', hot_exercises: []}, grammar_groups: {name: '语法', hot_exercises: []},
                 dictation_groups: {name: '听写', hot_exercises: []}, writing_questions: {name: '写作批改', hot_exercises: []},
                 reproduction_questions: {name: '记忆复写', hot_exercises: []}}
    # 词汇 语法 听写
    exercise_types = {1 => 'vocabulary_groups', 2 => 'grammar_groups', 3 => 'dictation_groups', 4 => 'writing_questions', 5 => 'reproduction_questions'}
    exercise_types.each do |idx, exercise_type|
      exercise_class = idx == 4 ? JijingQuestion : exercise_type.classify.constantize
      exercise_class_sym = exercise_type.to_sym
      HotExercise.where(hot_type: idx).each do |hot_exercise|
        hot_exercise = exercise_class.find(id: hot_exercise.hot_type_id)
        sequence_number = idx == 3 ? hot_exercise.name : hot_exercise.sequence_number
        question_message = {id: hot_exercise.id, sequence_number: sequence_number, exercise_count: hot_exercise.counter}
        question_message.merge!(content: hot_exercise.content) if idx >= 4
        exercises[exercise_class_sym][:hot_exercises].push(question_message)
      end
    end
  end
end
