CarrierWave.configure do |config|
  config.storage = :upyun
  config.upyun_username = "newbbs"
  config.upyun_password = '1q2w3e4r'
  config.upyun_bucket = "newbbs"
  config.upyun_bucket_host = "http://newbbs.b0.upaiyun.com"
  # config.storage = :aliyun
  # config.aliyun_access_id = "p8QhQTyWU2yVZTGd"
  # config.aliyun_access_key = '80z0KRZZAWyK686Q4a5nTdsFbH6jJv'
  # # 你需要在 Aliyum OSS 上面提前创建一个 Bucket
  # config.aliyun_bucket = "pigai"
  # # 是否使用内部连接，true - 使用 Aliyun 局域网的方式访问  false - 外部网络访问
  # config.aliyun_internal = false
  # # 配置存储的地区数据中心，默认: cn-hangzhou
  # # config.aliyun_area = "cn-hangzhou"
  # # 使用自定义域名，设定此项，carrierwave 返回的 URL 将会用自定义域名
  # # 自定于域名请 CNAME 到 you_bucket_name.oss.aliyuncs.com (you_bucket_name 是你的 bucket 的名称)
  # # config.aliyun_host = "foo.bar.com"
end
