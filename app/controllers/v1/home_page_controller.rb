# encoding: utf-8

class V1::HomePageController < ApplicationController
  def hot_exercises
    exercises = {vocabulary_groups: {name: '词汇', hot_exercises: []}, grammar_groups: {name: '语法', hot_exercises: []},
                 dictation_groups: {name: '听写', hot_exercises: []}, writing_questions: {name: '写作批改', hot_exercises: []},
                 reproduction_questions: {name: '记忆复写', hot_exercises: []}}
    # 词汇
    VocabularyGroup.limit(2).each do |vocabulary_group|
      exercise_count = rand(800..1000)
      question_message = {id: vocabulary_group.id, sequence_number: vocabulary_group.sequence_number, exercise_count: exercise_count}
      exercises[:vocabulary_groups][:hot_exercises].push(question_message)
    end

    # 语法
    GrammarGroup.limit(2).each do |grammar_group|
      exercise_count = rand(1100..1500)
      question_message = {id: grammar_group.id, sequence_number: grammar_group.sequence_number, exercise_count: exercise_count}
      exercises[:grammar_groups][:hot_exercises].push(question_message)
    end

    # 听写
    DictationGroup.limit(2).each do |dictation_group|
      exercise_count = rand(900..1100)
      question_message = {id: dictation_group.id, sequence_number: dictation_group.name, exercise_count: exercise_count}
      exercises[:dictation_groups][:hot_exercises].push(question_message)
    end

    # 写作批改
    JijingQuestion.includes(:jijing_group).where(question_type: 2).limit(2).each do |jijing_question|
      jijing_group = jijing_question.jijing_group
      exercise_count = rand(700..900)
      question_message = {id: jijing_question.id, sequence_number: jijing_question.sequence_number, exercise_count: exercise_count, content: jijing_question.content}
      exercises[:writing_questions][:hot_exercises].push(question_message)
    end

    # 记忆复写
    ReproductionQuestion.limit(2).each do |reproduction_question|
      exercise_count = rand(1500..1800)
      question_message = {id: reproduction_question.id, sequence_number: reproduction_question.sequence_number, exercise_count: exercise_count, content: reproduction_question.content}
      exercises[:reproduction_questions][:hot_exercises].push(question_message)
    end
    render json: exercises
  end
end
