class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at
  has_many :article_marks
end