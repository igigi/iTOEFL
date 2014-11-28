# encoding: utf-8

class HotExerciseWorker
  include Sidekiq::Worker

  def perform
    # 词汇
    vocabulary_results = VocabularyResult.select('vocabulary_group_id, count(vocabulary_group_id) as group_count').group(:vocabulary_group_id).order('group_count desc').limit(10)
    hot_vocabulary_ids = HotExercise.where(hot_type: 1).order(counter: :desc).ids
    hot_vocabulary_count = hot_vocabulary_ids.size
    vocabulary_results.each_with_index do |hot_vocabulary, idx|
      if hot_vocabulary_count >= (idx + 1)
        hot_exercise = HotExercise.find(hot_vocabulary_ids[idx])
        HotExercise.update(hot_type_id: hot_vocabulary.vocabulary_group_id, counter: hot_vocabulary.group_count)
      else
        HotExercise.create(hot_type_id: hot_vocabulary.vocabulary_group_id, hot_type: 1, counter: hot_vocabulary.group_count)
      end
    end

    # 语法
    grammar_results = GrammarResult.select('grammar_group_id, count(grammar_group_id) as group_count').group(:grammar_group_id).order('group_count desc').limit(10)
    hot_grammar_ids = HotExercise.where(hot_type: 2).order(counter: :desc).ids
    hot_grammar_count = hot_grammar_ids.size
    grammar_results.each_with_index do |hot_grammar, idx|
      if hot_grammar_count >= (idx + 1)
        hot_exercise = HotExercise.find(hot_grammar_ids[idx])
        HotExercise.update(hot_type_id: hot_grammar.grammar_group_id, counter: hot_grammar.group_count)
      else
        HotExercise.create(hot_type_id: hot_grammar.grammar_group_id, hot_type: 1, counter: hot_grammar.group_count)
      end
    end

    # 听写
    dictation_results = DictationResult.select('dictation_group_id, count(dictation_group_id) as group_count').group(:dictation_group_id).order('group_count desc').limit(10)
    hot_dictation_ids = HotExercise.where(hot_type: 3).order(counter: :desc).ids
    hot_dictation_count = hot_dictation_ids.size
    dictation_results.each_with_index do |hot_dictation, idx|
      if hot_dictation_count >= (idx + 1)
        hot_exercise = HotExercise.find(hot_dictation_ids[idx])
        HotExercise.update(hot_type_id: hot_dictation.dictation_group_id, counter: hot_dictation.group_count)
      else
        HotExercise.create(hot_type_id: hot_dictation.dictation_group_id, hot_type: 1, counter: hot_dictation.group_count)
      end
    end

    # 写作

    # 记忆复写
  end
end
