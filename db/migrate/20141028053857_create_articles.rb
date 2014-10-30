class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.references :user, index: true
      t.text :content
      t.string :status

      t.timestamps
    end
  end
end
