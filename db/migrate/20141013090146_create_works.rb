class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :standpoint
      t.string :content
      t.references :question, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
