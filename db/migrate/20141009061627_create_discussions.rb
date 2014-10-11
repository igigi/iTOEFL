class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.string :content
      t.string :media_url
      t.references :user, index: true

      t.timestamps
    end
  end
end
