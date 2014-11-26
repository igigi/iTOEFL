class AddAudioLengthToJijingMarks < ActiveRecord::Migration
  def change
    add_column :jijing_marks, :audio_length, :string
  end
end
