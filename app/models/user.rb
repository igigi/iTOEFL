class User < ActiveRecord::Base
  validates :open_id, uniqueness: true

  has_many :rb_favorites, dependent: :destroy
  has_many :question_histories, dependent: :destroy

  before_create :set_auth_token

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
