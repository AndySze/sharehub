CarrierWave.configure do |config|
  config.storage = :aliyun
  config.aliyun_access_id = "ACSGPCCrLsjQuiyt"
  config.aliyun_access_key = 'wN8ac8sRh1'
  # you need create this bucket first!
  config.aliyun_bucket = "andysze"
end
