Rails.application.config.middleware.use OmniAuth::Builder do
  # don't work
  provider :weibo, '3784245207', '7c23e413a6a182b6df09a2b982a5fefd'
  # temporary
  provider :qq_connect, '101169094', '0b60274b26851c37d98fabb3399a5238'
end
