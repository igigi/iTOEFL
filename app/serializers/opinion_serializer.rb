class OpinionSerializer < ActiveModel::Serializer
  attributes :id, :content, :media_url, :seat, :media_type, :media_length, :status, :created_at, :favorited_count, :favorited
  has_one :user
  has_one :owner

 def favorited_count
  	object.votes_for.size
  end
  def favorited
  	current_user.voted_for? object
  end
end
