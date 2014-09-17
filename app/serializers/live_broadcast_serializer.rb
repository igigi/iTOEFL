class LiveBroadcastSerializer < ApplicationSerializer
  attributes :id, :title, :cover, :teacher, :summary, :video_url, :start_at, :end_at, :status
end
