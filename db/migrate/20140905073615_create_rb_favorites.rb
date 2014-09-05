class CreateRbFavorites < ActiveRecord::Migration
  def change
    create_table :rb_favorites do |t|
      t.references :user, index: true
      t.references :recorded_broadcast, index: true

      t.timestamps
    end
  end
end
