class VocabularyResult < ActiveRecord::Base
  #validates :user_id, :vocabulary_question_id, :vocabulary_group_id, presence: true
  belongs_to :user
  belongs_to :vocabulary_question
  belongs_to :vocabulary_group
end
