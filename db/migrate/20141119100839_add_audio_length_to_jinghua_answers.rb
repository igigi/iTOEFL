class AddAudioLengthToJinghuaAnswers < ActiveRecord::Migration
  def change
    add_column :jinghua_answers, :audio_length, :integer
  end
end
