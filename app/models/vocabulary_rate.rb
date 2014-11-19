class VocabularyRate < ActiveRecord::Base
  belongs_to :user
  belongs_to :vocabulary_group
end
