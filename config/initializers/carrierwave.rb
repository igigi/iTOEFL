CarrierWave.configure do |config|
  config.storage = :upyun
  config.upyun_username = "newbbs/newbbs"
  config.upyun_password = '1q2w3e4r'
  config.upyun_bucket = "newbbs"
  config.upyun_bucket_host = "http://v0.api.upyun.com"
end