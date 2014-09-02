class AddProfileToStudents < ActiveRecord::Migration
  def change
    add_reference :students, :profile, index: true
  end
end
