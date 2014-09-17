class RbCommentSerializer < ApplicationSerializer
  attributes :id, :content, :created_at, :user_nickname
  def user_nickname
    object.user.nickname
  end
  
end
