class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :avatar
      t.string :nickname
      t.string :gender
      t.string :grade
      t.string :phone
      t.references :user, index: true

      t.timestamps
    end
  end
end
