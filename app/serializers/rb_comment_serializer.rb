class RbCommentSerializer < ApplicationSerializer
  attributes :id, :content, :created_at, :user_nickname

  def user_nickname
  	profile = object.user.profile
    profile.present? ? profile.nickname : ''
  end
end
