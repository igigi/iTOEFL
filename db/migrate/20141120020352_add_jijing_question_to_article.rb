class AddJijingQuestionToArticle < ActiveRecord::Migration
  def change
    add_reference :articles, :jijing_question, index: true
  end
end
