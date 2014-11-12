class User < ActiveRecord::Base
  validates :open_id, uniqueness: true

  has_many :article_marks, dependent: :destroy

  has_many :articles, dependent: :destroy

  has_many :jijing_answers

  has_many :jinghua_answers

  has_one :profile
  has_many :feedbacks

  has_many :reproduction_results

  has_many :rb_favorites, dependent: :destroy
  has_many :tasks, dependent: :destroy

  has_many :discussions, dependent: :destroy
  has_many :tasks, dependent: :destroy

  before_create :set_auth_token

  acts_as_voter

  private

    def set_auth_token	
      return if auth_token.present?	
      self.auth_token = generate_auth_token	
    end

    def generate_auth_token	
      loop do	
        token = SecureRandom.hex	
        break token unless self.class.exists?(auth_token: token)	
      end	
    end
end
