class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at, :jijing_question
  has_many :article_marks

  def jijing_question
  	{ content: object.jijing_question.content, title: object.jijing_question.jijing_group.name }
  end
end