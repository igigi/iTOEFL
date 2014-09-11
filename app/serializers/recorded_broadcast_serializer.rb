class RecordedBroadcastSerializer < ApplicationSerializer
  attributes :id, :title, :cover, :summary, :video_url,:rb_favorites_count, :play_count
end
