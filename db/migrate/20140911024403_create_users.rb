class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :origin
      t.string :open_id
      t.string :password
      t.string :auth_token
      t.string :nickname

      t.timestamps
    end
  end
end
