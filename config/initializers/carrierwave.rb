CarrierWave.configure do |config|
  config.storage = :aliyun
  config.aliyun_access_id = "ACSGPCCrLsjQuiyt"
  config.aliyun_access_key = 'wN8ac8sRh1'
  # you need create this bucket first!
  config.aliyun_bucket = "andysze"
  # 是否使用内部连接，true - 使用 Aliyun 局域网的方式访问  false - 外部网络访问
  config.aliyun_internal = true
end
