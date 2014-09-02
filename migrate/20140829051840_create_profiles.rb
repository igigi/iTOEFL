class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :sex
      t.string :avatar

      t.timestamps
    end
  end
end
