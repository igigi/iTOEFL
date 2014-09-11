class CreateRbComments < ActiveRecord::Migration
  def change
    create_table :rb_comments do |t|
      t.text :content
      t.references :user, index: true
      t.references :recorded_broadcast, index: true

      t.timestamps
    end
  end
end
