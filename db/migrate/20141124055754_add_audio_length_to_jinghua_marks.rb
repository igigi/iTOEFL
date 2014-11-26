class AddAudioLengthToJinghuaMarks < ActiveRecord::Migration
  def change
    add_column :jinghua_marks, :audio_length, :string
  end
end
