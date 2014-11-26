class CustomArticleSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at, :user, :jijing_question
  
  def user
  	object.user.profile
  end
  def jijing_question
  	{ content: object.jijing_question.content, title: object.jijing_question.jijing_group.name }
  end
end