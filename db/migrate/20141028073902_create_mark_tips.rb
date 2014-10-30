class CreateMarkTips < ActiveRecord::Migration
  def change
    create_table :mark_tips do |t|
      t.integer :start_index
      t.integer :end_index
      t.string :audio_url
      t.references :article_mark, index: true

      t.timestamps
    end
  end
end
