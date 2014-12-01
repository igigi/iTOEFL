# encoding: utf-8

class HotExerciseWorker
  include Sidekiq::Worker
  sidekiq_options :queue => :hot_exercise

  def perform
    # 词汇
    vocabulary_results = VocabularyResult.select('vocabulary_group_id, count(vocabulary_group_id) as group_count').group(:vocabulary_group_id).order('group_count desc').limit(10)
    hot_vocabulary_ids = HotExercise.where(hot_type: 1).order(counter: :desc).ids
    hot_vocabulary_count = hot_vocabulary_ids.size
    vocabulary_results.each_with_index do |hot_vocabulary, idx|
      if hot_vocabulary_count >= (idx + 1)
        hot_exercise = HotExercise.find(hot_vocabulary_ids[idx])
        hot_exercise.update(hot_type_id: hot_vocabulary.vocabulary_group_id, counter: hot_vocabulary.group_count)
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
        hot_exercise.update(hot_type_id: hot_grammar.grammar_group_id, counter: hot_grammar.group_count)
      else
        HotExercise.create(hot_type_id: hot_grammar.grammar_group_id, hot_type: 2, counter: hot_grammar.group_count)
      end
    end

    # 听写
    # dictation_results = DictationResult.select('dictation_question_id, count(dictation_group_id) as group_count').group(:dictation_group_id).order('group_count desc').limit(10)
    dictation_results = DictationResult.joins(:dictation_question).select('dictation_group_id, count(dictation_group_id) as group_count').group('dictation_group_id').order('group_count desc').limit(10)
    hot_dictation_ids = HotExercise.where(hot_type: 3).order(counter: :desc).ids
    hot_dictation_count = hot_dictation_ids.size
    dictation_results.each_with_index do |hot_dictation, idx|
      if hot_dictation_count >= (idx + 1)
        hot_exercise = HotExercise.find(hot_dictation_ids[idx])
        hot_exercise.update(hot_type_id: hot_dictation.dictation_group_id, counter: hot_dictation.group_count)
      else
        HotExercise.create(hot_type_id: hot_dictation.dictation_group_id, hot_type: 3, counter: hot_dictation.group_count)
      end
    end

    # 写作
    articles = Article.select('jijing_question_id, count(jijing_question_id) as question_count').group(:jijing_question_id).order('question_count desc').limit(10)
    hot_article_ids = HotExercise.where(hot_type: 4).order(counter: :desc).ids
    hot_article_count = hot_article_ids.size
    articles.each_with_index do |hot_article, idx|
      if hot_article_count >= (idx + 1)
        hot_exercise = HotExercise.find(hot_article_ids[idx])
        hot_exercise.update(hot_type_id: hot_article.jijing_question_id, counter: hot_article.question_count)
      else
        HotExercise.create(hot_type_id: hot_article.jijing_question_id, hot_type: 4, counter: hot_article.question_count)
      end
    end

    # 记忆复写
    reproduction_results = ReproductionResult.select('reproduction_question_id, count(reproduction_question_id) as question_count').group(:reproduction_question_id).order('question_count desc').limit(10)
    hot_reproduction_ids = HotExercise.where(hot_type: 5).order(counter: :desc).ids
    hot_reproduction_count = hot_reproduction_ids.size
    reproduction_results.each_with_index do |hot_reproduction, idx|
      if hot_reproduction_count >= (idx + 1)
        hot_exercise = HotExercise.find(hot_reproduction_ids[idx])
        hot_exercise.update(hot_type_id: hot_reproduction.reproduction_question_id, counter: hot_reproduction.question_count)
      else
        HotExercise.create(hot_type_id: hot_reproduction.reproduction_question_id, hot_type: 5, counter: hot_reproduction.question_count)
      end
    end
  end
end
