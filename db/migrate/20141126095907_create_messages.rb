class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :content_id
      t.integer :content_type
      t.string  :content
      t.boolean :is_pushed, default: false
      t.boolean :is_readed
      t.integer :push_count, default: 0
      t.datetime :push_at
      t.datetime :read_at

      t.timestamps
    end
  end
end
