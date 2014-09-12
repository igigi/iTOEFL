class CreateLbComments < ActiveRecord::Migration
  def change
    create_table :lb_comments do |t|
      t.text :content
      t.references :user, index: true
      t.references :live_broadcast, index: true

      t.timestamps
    end
  end
end
