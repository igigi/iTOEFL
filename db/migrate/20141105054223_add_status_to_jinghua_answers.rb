class AddStatusToJinghuaAnswers < ActiveRecord::Migration
  def change
    add_column :jinghua_answers, :status, :string
  end
end
