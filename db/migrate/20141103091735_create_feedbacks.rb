class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.text :content
      t.string :device
      t.string :system
      t.string :version
      t.references :user, index: true

      t.timestamps
    end
  end
end
