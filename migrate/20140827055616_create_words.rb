class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :name
      t.string :symbol
      t.string :character
      t.string :explain_c
      t.string :explain_e
      t.string :root
      t.string :affix_h
      t.string :affix_f
      t.string :voice

      t.timestamps
    end
  end
end
