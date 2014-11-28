Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://0.0.0.0:7372/12' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://0.0.0.0:7372/12' }
end