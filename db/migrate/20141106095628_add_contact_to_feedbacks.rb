class AddContactToFeedbacks < ActiveRecord::Migration
  def change
    add_column :feedbacks, :contact, :string
  end
end
