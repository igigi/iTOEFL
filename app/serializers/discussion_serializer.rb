class DiscussionSerializer < ActiveModel::Serializer
  attributes :id, :content, :media_url, :media_type, :media_length, :created_at, :favorited_count, :favorited, :reply_count
  has_one :user

  def favorited
  	current_user.voted_for? object
  end

  def favorited_count
  	object.votes_for.size
  end
end
