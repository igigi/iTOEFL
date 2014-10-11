class CreateOpinions < ActiveRecord::Migration
  def change
    create_table :opinions do |t|
      t.string :content
      t.string :media_url
      t.integer :seat
      t.references :discussion, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
