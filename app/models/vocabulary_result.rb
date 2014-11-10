class VocabularyResult < ActiveRecord::Base
  belongs_to :user
  belongs_to :vocabulary_question
  belongs_to :vocabulary_group
end
