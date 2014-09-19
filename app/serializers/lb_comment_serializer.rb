class LbCommentSerializer < ApplicationSerializer
  attributes :id, :content, :user_nickname, :created_at
  def user_nickname
    object.user.nickname
  end
end
