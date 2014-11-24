class AddAudioLengthToJijingAnswers < ActiveRecord::Migration
  def change
    add_column :jijing_answers, :audio_length, :integer
  end
end
