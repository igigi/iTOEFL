class PushWorker
  include Sidekiq::Worker
  sidekiq_options retry: 3

  def perform(message_id)
     Push.mark_push(message_id)
  end
end