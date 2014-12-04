class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at, :jijing_question
  has_many :article_marks

  def jijing_question
    jijing_question = object.jijing_question
  	{ id: jijing_question.id, content: jijing_question.content, title: jijing_question.jijing_group.name }
  end
end
