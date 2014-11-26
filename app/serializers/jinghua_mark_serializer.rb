class JinghuaMarkSerializer < ActiveModel::Serializer
  attributes :id, :content, :score, :user
  # has_one :user

  def user
    teacher = object.user
    teacher.present? ? {id: teacher.id, origin: teacher.origin, open_id: teacher.open_id, auth_token: teacher.auth_token, nickname: object.nickname, password: teacher.password} : nil
  end
end
