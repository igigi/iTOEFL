class RecordedBroadcastSerializer < ApplicationSerializer
  attributes :id, :title, :cover, :summary, :video_url,:rb_favorites_count, :play_count, :favorite

  def favorite
    object.rb_favorites.where(user: current_user).ids
  end
end
