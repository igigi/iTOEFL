class CreateKnowledgePoints < ActiveRecord::Migration
  def change
    create_table :knowledge_points do |t|
      t.string :name

      t.timestamps
    end
  end
end
