class LbCommentSerializer < ApplicationSerializer
  attributes :id, :content, :user_nickname, :created_at
  def user_nickname
    profile = object.user.profile
    profile.present? ? profile.nickname : ''
  end
end
